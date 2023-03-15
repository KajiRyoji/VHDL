--------------------------------------------------------------------------------
-- Copyright (C) 1999-2008 Easics NV.
-- This source file may be used and distributed without restriction
-- provided that this copyright statement is not removed from the file
-- and that any derivative work contains the original copyright notice
-- and the associated disclaimer.
--
-- THIS SOURCE FILE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS
-- OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
-- WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
--
-- Purpose : synthesizable CRC function
--   * polynomial: x^32 + x^26 + x^23 + x^22 + x^16 + x^12 + x^11 + x^10 + x^8 + x^7 + x^5 + x^4 + x^2 + x^1 + 1
--   * data width: 1
--
-- Info : tools@easics.be
--        http://www.easics.com
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

package PCK_CRC32_D1 is
  -- polynomial: x^32 + x^26 + x^23 + x^22 + x^16 + x^12 + x^11 + x^10 + x^8 + x^7 + x^5 + x^4 + x^2 + x^1 + 1
  -- data width: 1
  -- convention: the first serial bit is D[0]
  function nextCRC32_D1
    (Data: std_logic;
     crc:  std_logic_vector(31 downto 0))
    return std_logic_vector;
end PCK_CRC32_D1;


package body PCK_CRC32_D1 is

  -- polynomial: x^32 + x^26 + x^23 + x^22 + x^16 + x^12 + x^11 + x^10 + x^8 + x^7 + x^5 + x^4 + x^2 + x^1 + 1
  -- data width: 1
  -- convention: the first serial bit is D[0]
  function nextCRC32_D1
    (Data: std_logic;
     crc:  std_logic_vector(31 downto 0))
    return std_logic_vector is

    variable d:      std_logic_vector(0 downto 0);
    variable c:      std_logic_vector(31 downto 0);
    variable newcrc: std_logic_vector(31 downto 0);

  begin
    d(0) := Data;
    c := crc;

    newcrc(0) := d(0) xor c(31);
    newcrc(1) := d(0) xor c(0) xor c(31);
    newcrc(2) := d(0) xor c(1) xor c(31);
    newcrc(3) := c(2);
    newcrc(4) := d(0) xor c(3) xor c(31);
    newcrc(5) := d(0) xor c(4) xor c(31);
    newcrc(6) := c(5);
    newcrc(7) := d(0) xor c(6) xor c(31);
    newcrc(8) := d(0) xor c(7) xor c(31);
    newcrc(9) := c(8);
    newcrc(10) := d(0) xor c(9) xor c(31);
    newcrc(11) := d(0) xor c(10) xor c(31);
    newcrc(12) := d(0) xor c(11) xor c(31);
    newcrc(13) := c(12);
    newcrc(14) := c(13);
    newcrc(15) := c(14);
    newcrc(16) := d(0) xor c(15) xor c(31);
    newcrc(17) := c(16);
    newcrc(18) := c(17);
    newcrc(19) := c(18);
    newcrc(20) := c(19);
    newcrc(21) := c(20);
    newcrc(22) := d(0) xor c(21) xor c(31);
    newcrc(23) := d(0) xor c(22) xor c(31);
    newcrc(24) := c(23);
    newcrc(25) := c(24);
    newcrc(26) := d(0) xor c(25) xor c(31);
    newcrc(27) := c(26);
    newcrc(28) := c(27);
    newcrc(29) := c(28);
    newcrc(30) := c(29);
    newcrc(31) := c(30);
    return newcrc;
  end nextCRC32_D1;

end PCK_CRC32_D1;
