--ORGATE
entity ORgate is
port (A,B: in bit;
C : out bit);
end entity ORgate;
architecture Struct of ORgate is
begin
C <= A or B;
end Struct;

--NANDGATE
entity NANDgate is
port (A,B: in bit;
C : out bit);
end entity NANDgate;
architecture Struct of NANDgate is
begin
C <= A nand B;
end Struct;

--XORgate
entity XORgate is
port (A,B: in bit;
C : out bit);
end entity XORgate;
architecture Struct of XORgate is
begin
C <= A xor B;
end Struct;

--NOTGATE
entity NOTgate is
port (A: in bit;
B : out bit);
end entity NOTgate;
architecture Struct of NOTgate is
begin
--NOT
B <= not A;
end Struct;

--ANDGATE
entity ANDgate is
port (A,B,C: in bit;
D : out bit);
end entity ANDgate;
architecture Struct of ANDgate is
begin

D <= A and B and C;
end Struct;

--Top Entity
entity GeneralALU is 
port(a,b: in bit_vector(15 downto 0);
		s: in bit_vector(1 downto 0);
		carry: out bit_vector(15 downto 0);
		b_bar_test: out bit_vector(15 downto 0);
		c: out bit_vector(15 downto 0);
		z: out bit := '0');
end GeneralALU;

architecture Behavioral of GeneralALU is

signal g,p,G0,P0,b_bar, b_hold: bit_vector(15 downto 0);
signal G1,P1: bit_vector(14 downto 0);
signal G2,P2: bit_vector(13 downto 0);
signal G3,P3: bit_vector(11 downto 0);
signal zero_test: bit_vector(15 downto 0);


begin
process(a,b,s,g,p,G0,P0,G1,P1,G2,P2,G3,P3)
begin
case s is 
	when "00" =>
	g <= a and b;
	p <= a xor b;
	G0(0) <= g(0); 
	P0(0) <= p(0);
	
	for i in 14 downto 0 loop
	G1(i) <= g(i + 1) or (p(i + 1) and g(i));
	P1(i) <= p(i + 1) and p(i);
	end loop;
	G0(1) <= G1(0); 
	P0(1) <= P1(0); 
	
	
	for i in 13 downto 1 loop
	G2(i) <= G1(i + 1) or (P1(i + 1) and G1(i - 1));
	P2(i) <= P1(i + 1) and P1(i - 1);
	end loop;
	G0(2) <= G1(1) or (P1(1) and G0(0)); 
	P0(2) <= P1(1) and P0(0);
	G0(3) <= G2(1); 
	P0(3) <= P2(1);
	
	for i in 11 downto 3  loop
	G3(i) <= G2(i + 2) or (P2(i + 2) and G2(i - 2));
	P3(i) <= P2(i + 2) and P2(i - 2);
	end loop;
	
	G0(4) <= G2(2) or (P2(2) and G0(0)); 
	P0(4) <= P2(2) and P0(0);
	G0(5) <= G2(3) or (P2(3) and G0(1)); 
	P0(5) <= P2(3) and P0(1);
	G0(6) <= G2(4) or (P2(4) and G0(2)); 
	P0(6) <= P2(4) and P0(2);
	G0(7) <= G3(3);  
	P0(7) <= P3(3);

	for i in 15 downto 8 loop 
	G0(i) <= G3(i - 4) or (P3(i - 4) and G0(i - 8));
	P0(i) <= P3(i - 4) and P0(i - 8);
	end loop;
	
	c(0) <= P0(0);
	zero_test(0) <= P0(0);
	for i in 15 downto 1 loop
	
	c(i) <= p(i) xor G0(i - 1);
	zero_test(i) <= p(i) xor G0(i - 1);
	end loop;
	
	carry <= G0;
	if zero_test = "0000000000000000" then 
	z <= '1';
	else
	z <= '0';
	end if;

	when "01" =>

	for i in 15 to 0 loop 
	b_bar(i) <= not b(i); --complement
	end loop;
	
	
	b_bar_test <= b_bar;
	g <= a and b_bar;
	p <= a xor b_bar;
	
	G0(0) <= g(0); 
	P0(0) <= p(0);
	
	for i in 14 downto 0 loop
	G1(i) <= g(i + 1) or (p(i + 1) and g(i));
	P1(i) <= p(i + 1) and p(i);
	end loop;
	G0(1) <= G1(0); 
	P0(1) <= P1(0); 
	
	
	for i in 13 downto 1 loop
	G2(i) <= G1(i + 1) or (P1(i + 1) and G1(i - 1));
	P2(i) <= P1(i + 1) and P1(i - 1);
	end loop;
	G0(2) <= G1(1) or (P1(1) and G0(0)); 
	P0(2) <= P1(1) and P0(0);
	G0(3) <= G2(1); 
	P0(3) <= P2(1);
	
	for i in 11 downto 3  loop
	G3(i) <= G2(i + 2) or (P2(i + 2) and G2(i - 2));
	P3(i) <= P2(i + 2) and P2(i - 2);
	end loop;
	
	G0(4) <= G2(2) or (P2(2) and G0(0)); 
	P0(4) <= P2(2) and P0(0);
	G0(5) <= G2(3) or (P2(3) and G0(1)); 
	P0(5) <= P2(3) and P0(1);
	G0(6) <= G2(4) or (P2(4) and G0(2)); 
	P0(6) <= P2(4) and P0(2);
	G0(7) <= G3(3);  
	P0(7) <= P3(3);

	for i in 15 downto 8 loop 
	G0(i) <= G3(i - 4) or (P3(i - 4) and G0(i - 8));
	P0(i) <= P3(i - 4) and P0(i - 8);
	end loop;
	
	c(0) <= not P0(0); --carry 1
	for i in 15 downto 1 loop
	
	c(i) <= p(i) xor (G0(i - 1) or P0(i-1)); --carry 1
	end loop;
	
	carry <= G0 or P0; --carry 1	
	
	when "10" =>
	for i in 15 downto 0 loop
	c(i) <= a(i) nand b(i);
	end loop;
	carry <= "0000000000000000";
	
	
	when "11" =>
	
	for i in 15 downto 0 loop
	c(i) <= a(i) xor b(i);
	end loop;
	carry <= "0000000000000000";
	
	
end case;
end process;
end Behavioral;