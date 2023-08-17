entity testbenchALU is
end testbenchALU;
  
architecture behavior of testbenchALU is
	signal a,b,c,carry : bit_vector(15 downto 0); 
	signal s : bit_vector(1 downto 0); 
	signal z : bit := '0';
component GeneralALU
port(
a,b : in bit_vector(15 downto 0);
s : in bit_vector(1 downto 0);
c,carry: out bit_vector(15 downto 0);
z: out bit
);
end component;
begin
dut_instance: GeneralALU 
port map (
a => a,
b => b,
s => s,
carry => carry,
c => c,
z => z
);

process
begin

wait for 100 ns;


a <= "0000000000000000";
b <= "0000000000000000";

s <= "00";
wait for 100 ns;
s <= "01";
wait for 100 ns;
s <= "10";
wait for 100 ns;
s <= "11";
wait for 100 ns;


a <= "1111111111111111";
b <= "1111111111111111";

s <= "00";
wait for 100 ns;
s <= "01";
wait for 100 ns;
s <= "10";
wait for 100 ns;
s <= "11";
wait for 100 ns;


a <= "1001001011001111";
b <= "1111001111011101";

s <= "00";
wait for 100 ns;
s <= "01";
wait for 100 ns;
s <= "10";
wait for 100 ns;
s <= "11";
wait for 100 ns;


a <= "1010101010101010";
b <= "1010101010101010";

s <= "00";
wait for 100 ns;
s <= "01";
wait for 100 ns;
s <= "10";
wait for 100 ns;
s <= "11";
wait for 100 ns;


a <= "1010101010101010";
b <= "0101010101010101";

s <= "00";
wait for 100 ns;
s <= "01";
wait for 100 ns;
s <= "10";
wait for 100 ns;
s <= "11";
wait for 100 ns;


a <= "0111010101001110";
b <= "1011110100111001";

s <= "00";
wait for 100 ns;
s <= "01";
wait for 100 ns;
s <= "10";
wait for 100 ns;
s <= "11";
wait for 100 ns;
a <= "1111111100000000";
b <= "1010101011011010";

s <= "00";
wait for 100 ns;
s <= "01";
wait for 100 ns;
s <= "10";
wait for 100 ns;
s <= "11";
wait for 100 ns;


a <= "1111111100000000";
b <= "1010101011011010";

s <= "00";
wait for 100 ns;
s <= "01";
wait for 100 ns;
s <= "10";
wait for 100 ns;
s <= "11";
wait for 100 ns;


a <= "1110111011101110";
b <= "1111111111111111";

s <= "00";
wait for 100 ns;
s <= "01";
wait for 100 ns;
s <= "10";
wait for 100 ns;
s <= "11";
wait for 100 ns;


a <= "0001000100010001";
b <= "1100110011001100";

s <= "00";
wait for 100 ns;
s <= "01";
wait for 100 ns;
s <= "10";
wait for 100 ns;
s <= "11";
wait for 100 ns;


a <= "0001000100010001";
b <= "1100110011001100";

s <= "00";
wait for 100 ns;
s <= "01";
wait for 100 ns;
s <= "10";
wait for 100 ns;
s <= "11";
wait for 100 ns;


a <= "1000100010001000";
b <= "1100110011001100";

s <= "00";
wait for 100 ns;
s <= "01";
wait for 100 ns;
s <= "10";
wait for 100 ns;
s <= "11";
wait for 100 ns;


a <= "1101101011010100";
b <= "1000000000000000";

s <= "00";
wait for 100 ns;
s <= "01";
wait for 100 ns;
s <= "10";
wait for 100 ns;
s <= "11";
wait for 100 ns;


a <= "1010101110110001";
b <= "1111111111111111";

s <= "00";
wait for 100 ns;
s <= "01";
wait for 100 ns;
s <= "10";
wait for 100 ns;
s <= "11";
wait for 100 ns;


a <= "1111111111111111";
b <= "1010101110000100";

s <= "00";
wait for 100 ns;
s <= "01";
wait for 100 ns;
s <= "10";
wait for 100 ns;
s <= "11";
wait for 100 ns;


a <= "1101010111111111";
b <= "0001011111111111";

s <= "00";
wait for 100 ns;
s <= "01";
wait for 100 ns;
s <= "10";
wait for 100 ns;
s <= "11";
wait for 100 ns;



a <= "1101000001000011";
b <= "1100110011001100";

s <= "00";
wait for 100 ns;
s <= "01";
wait for 100 ns;
s <= "10";
wait for 100 ns;
s <= "11";
wait for 100 ns;


a <= "0000000000000000";
b <= "1111111111111111";

s <= "00";
wait for 100 ns;
s <= "01";
wait for 100 ns;
s <= "10";
wait for 100 ns;
s <= "11";
wait for 100 ns;


a <= "1100111111000001";
b <= "1010101011100001";

s <= "00";
wait for 100 ns;
s <= "01";
wait for 100 ns;
s <= "10";
wait for 100 ns;
s <= "11";
wait for 100 ns;


a <= "1010101111111000";
b <= "1100000000000000";

s <= "00";
wait for 100 ns;
s <= "01";
wait for 100 ns;
s <= "10";
wait for 100 ns;
s <= "11";
wait for 100 ns;


a <= "1111111111110000";
b <= "1111111111110000";

s <= "00";
wait for 100 ns;
s <= "01";
wait for 100 ns;
s <= "10";
wait for 100 ns;
s <= "11";
wait for 100 ns;


end process;

end behavior;