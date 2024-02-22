----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/16/2024 11:29:01 AM
-- Design Name: 
-- Module Name: sevenSegDecoder_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenSegDecoder_tb is
--  Port ( );
end sevenSegDecoder_tb;

architecture Behavioral of sevenSegDecoder_tb is
    component sevenSegDecoder is
        port(
        i_D	:	in  std_logic_vector(3 downto 0);
        o_S :   out std_logic_vector(6 downto 0)
        );
    end component;
    
    signal w_sw	:  std_logic_vector(3 downto 0);
    signal w_seg :  std_logic_vector(7 downto 0);
    
begin
    sevenSegDecoder_inst: sevenSegDecoder port map(
       i_D => w_sw,
       o_S => w_seg (6 downto 0)
    );
    test_process : process 
	begin
	    w_seg(7) <= '0'; --fit into two digit hex (8 bits)
	    w_sw <= x"0"; wait for 10 ns;
	    assert w_seg = x"40" report "bad 0000" severity failure;
	    w_sw <= x"1"; wait for 10 ns;
        assert w_seg = x"79" report "bad 0001" severity failure;
		w_sw <= x"2"; wait for 10 ns;
        assert w_seg = x"24" report "bad 0010" severity failure;
        w_sw <= x"3"; wait for 10 ns;
        assert w_seg = x"30" report "bad 0011" severity failure;
        w_sw <= x"4"; wait for 10 ns;
        assert w_seg = x"19" report "bad 0100" severity failure;
        w_sw <= x"5"; wait for 10 ns;
        assert w_seg = x"12" report "bad 0101" severity failure;
        w_sw <= x"6"; wait for 10 ns;
        assert w_seg = x"02" report "bad 0110" severity failure;
        w_sw <= x"7"; wait for 10 ns;
        assert w_seg = x"78" report "bad 0111" severity failure;
        w_sw <= x"8"; wait for 10 ns;
        assert w_seg = x"00" report "bad 1000" severity failure;
        w_sw <= x"9"; wait for 10 ns;
        assert w_seg = x"18" report "bad 1001" severity failure;
        w_sw <= x"A"; wait for 10 ns;
        assert w_seg = x"08" report "bad 1010" severity failure;
        w_sw <= x"B"; wait for 10 ns;
        assert w_seg = x"03" report "bad 1011" severity failure;
        w_sw <= x"C"; wait for 10 ns;
        assert w_seg = x"27" report "bad 1100" severity failure;
        w_sw <= x"D"; wait for 10 ns;
        assert w_seg = x"21" report "bad 1101" severity failure;
        w_sw <= x"E"; wait for 10 ns;
        assert w_seg = x"06" report "bad 1110" severity failure;
        w_sw <= x"F"; wait for 10 ns;
        assert w_seg = x"0E" report "bad 1111" severity failure;
		wait; -- wait forever
	end process;	
end Behavioral;