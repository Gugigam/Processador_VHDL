library ieee;
use ieee.std_logic_1164.all;

entity decode16 is
	port(
		en_d16: in std_logic;
		i_d16: in std_logic_vector(3 downto 0);
		D_d16: out std_logic_vector(15 downto 0));
end decode16;

architecture behav of decode16 is

	signal out_aux: std_logic_vector (15 downto 0);
	signal in_aux: std_logic_vector (4 downto 0);

begin

in_aux <= en_d16 & i_d16(3) & i_d16(2) &i_d16(1) & i_d16(0);

with in_aux select
out_aux <=	"0000000000000001" when "10000",
			"0000000000000010" when "10001",
			"0000000000000100" when "10010",
			"0000000000001000" when "10011",
			"0000000000010000" when "10100",
			"0000000000100000" when "10101",
			"0000000001000000" when "10110",
			"0000000010000000" when "10111",
			"0000000100000000" when "11000",
			"0000001000000000" when "11001",
			"0000010000000000" when "11010",
			"0000100000000000" when "11011",
			"0001000000000000" when "11100",
			"0010000000000000" when "11101",
			"0100000000000000" when "11110",
			"1000000000000000" when "11111",
			"0000000000000000" when others;

D_d16 <= out_aux(15 downto 0);

end behav;
