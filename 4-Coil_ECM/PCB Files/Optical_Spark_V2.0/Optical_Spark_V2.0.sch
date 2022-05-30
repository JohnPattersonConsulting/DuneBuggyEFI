<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.2.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="16" fill="1" visible="no" active="no"/>
<layer number="3" name="Route3" color="17" fill="1" visible="no" active="no"/>
<layer number="4" name="Route4" color="18" fill="1" visible="no" active="no"/>
<layer number="5" name="Route5" color="19" fill="1" visible="no" active="no"/>
<layer number="6" name="Route6" color="25" fill="1" visible="no" active="no"/>
<layer number="7" name="Route7" color="26" fill="1" visible="no" active="no"/>
<layer number="8" name="Route8" color="27" fill="1" visible="no" active="no"/>
<layer number="9" name="Route9" color="28" fill="1" visible="no" active="no"/>
<layer number="10" name="Route10" color="29" fill="1" visible="no" active="no"/>
<layer number="11" name="Route11" color="30" fill="1" visible="no" active="no"/>
<layer number="12" name="Route12" color="20" fill="1" visible="no" active="no"/>
<layer number="13" name="Route13" color="21" fill="1" visible="no" active="no"/>
<layer number="14" name="Route14" color="22" fill="1" visible="no" active="no"/>
<layer number="15" name="Route15" color="23" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="24" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="99" name="SpiceOrder" color="5" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="Optical_Spark_Parts">
<packages>
<package name="HY860H_SMD">
<smd name="P$3" x="-6" y="4" dx="4" dy="1" layer="1" rot="R90"/>
<smd name="P$4" x="-6" y="-4" dx="4" dy="1" layer="1" rot="R90"/>
<smd name="P$2" x="6" y="4" dx="4" dy="1" layer="1" rot="R90"/>
<smd name="P$1" x="6" y="-4" dx="4" dy="1" layer="1" rot="R90"/>
<wire x1="-8" y1="3" x2="-8" y2="-3" width="0.127" layer="21"/>
<wire x1="-8" y1="-3" x2="8" y2="-3" width="0.127" layer="21"/>
<wire x1="8" y1="-3" x2="8" y2="3" width="0.127" layer="21"/>
<wire x1="8" y1="3" x2="-8" y2="3" width="0.127" layer="21"/>
<text x="-5" y="-2" size="1.27" layer="21">H(E)</text>
<text x="-5" y="1" size="1.27" layer="21">Y(C)</text>
<text x="4" y="-2" size="1.27" layer="21">A</text>
<text x="4" y="1" size="1.27" layer="21">K</text>
<hole x="-3.81" y="3.81" drill="1"/>
<hole x="3.81" y="3.81" drill="1"/>
<hole x="0" y="3.81" drill="1"/>
<hole x="-3.81" y="-3.81" drill="1"/>
<hole x="0" y="-3.81" drill="1"/>
<hole x="3.81" y="-3.81" drill="1"/>
<hole x="0" y="0" drill="1"/>
</package>
<package name="0.25W_THT_SMD">
<smd name="P$1" x="-5" y="0" dx="5" dy="2" layer="1"/>
<smd name="P$2" x="5" y="0" dx="5" dy="2" layer="1"/>
<wire x1="-4" y1="2" x2="4" y2="2" width="0.127" layer="21"/>
<wire x1="4" y1="2" x2="4" y2="-2" width="0.127" layer="21"/>
<wire x1="4" y1="-2" x2="-4" y2="-2" width="0.127" layer="21"/>
<wire x1="-4" y1="-2" x2="-4" y2="2" width="0.127" layer="21"/>
<text x="-1.905" y="-0.635" size="1.27" layer="21">&gt;VALUE</text>
</package>
<package name="PAD">
<smd name="P$1" x="0" y="0" dx="4" dy="2" layer="1"/>
</package>
<package name="NPN_THT_SMD_EBC">
<smd name="P$3" x="0.5" y="2" dx="4" dy="1" layer="1"/>
<smd name="P$2" x="0.5" y="0" dx="4" dy="1" layer="1"/>
<smd name="P$1" x="0.5" y="-2" dx="4" dy="1" layer="1"/>
<wire x1="2.5" y1="2" x2="3.5" y2="2" width="0.1524" layer="21"/>
<wire x1="2.5" y1="0" x2="3.5" y2="0" width="0.1524" layer="21"/>
<wire x1="2.5" y1="-2" x2="3.5" y2="-2" width="0.1524" layer="21"/>
<wire x1="3" y1="2.5" x2="3" y2="-2.5" width="0.1524" layer="21"/>
<wire x1="3" y1="2.5" x2="3" y2="-2.5" width="0.1524" layer="21" curve="-180"/>
<wire x1="3" y1="2.5" x2="5.5" y2="2.5" width="0.1524" layer="21"/>
<wire x1="3" y1="-2.5" x2="5.5" y2="-2.5" width="0.1524" layer="21"/>
<wire x1="5.5" y1="2.5" x2="5.5" y2="-2.5" width="0.1524" layer="21" curve="-180"/>
</package>
<package name="0.25W_THT_SMD_SMALL">
<smd name="P$1" x="-4" y="0" dx="3" dy="2" layer="1"/>
<smd name="P$2" x="4" y="0" dx="3" dy="2" layer="1"/>
<wire x1="-3" y1="1.5" x2="3" y2="1.5" width="0.127" layer="21"/>
<wire x1="3" y1="1.5" x2="3" y2="-1.5" width="0.127" layer="21"/>
<wire x1="3" y1="-1.5" x2="-3" y2="-1.5" width="0.127" layer="21"/>
<wire x1="-3" y1="-1.5" x2="-3" y2="1.5" width="0.127" layer="21"/>
<text x="-1.905" y="-0.635" size="1.27" layer="21">&gt;VALUE</text>
</package>
<package name="SMALLCAP_THT_SMD">
<smd name="P$1" x="-1" y="1.27" dx="4" dy="2" layer="1" rot="R90"/>
<smd name="P$2" x="2" y="1.27" dx="4" dy="2" layer="1" rot="R90"/>
<wire x1="-3" y1="3" x2="4" y2="3" width="0.127" layer="21"/>
<wire x1="4" y1="3" x2="4" y2="-1" width="0.127" layer="21"/>
<wire x1="4" y1="-1" x2="-3" y2="-1" width="0.127" layer="21"/>
<wire x1="-3" y1="-1" x2="-3" y2="3" width="0.127" layer="21"/>
<text x="-2.905" y="-2.365" size="1.27" layer="21">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="OK">
<wire x1="-2.413" y1="-1.143" x2="-1.016" y2="0.254" width="0.1524" layer="94"/>
<wire x1="-1.016" y1="0.254" x2="-1.905" y2="-0.127" width="0.1524" layer="94"/>
<wire x1="-1.905" y1="-0.127" x2="-1.397" y2="-0.635" width="0.1524" layer="94"/>
<wire x1="-1.397" y1="-0.635" x2="-1.016" y2="0.254" width="0.1524" layer="94"/>
<wire x1="-1.143" y1="1.397" x2="-2.032" y2="1.016" width="0.1524" layer="94"/>
<wire x1="-2.032" y1="1.016" x2="-1.524" y2="0.508" width="0.1524" layer="94"/>
<wire x1="-1.524" y1="0.508" x2="-1.143" y2="1.397" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.143" y2="1.397" width="0.1524" layer="94"/>
<wire x1="-3.175" y1="1.27" x2="-4.445" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-4.445" y1="-1.27" x2="-5.715" y2="1.27" width="0.254" layer="94"/>
<wire x1="-3.175" y1="-1.27" x2="-4.445" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-4.445" y1="-1.27" x2="-5.715" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-3.175" y1="1.27" x2="-4.445" y2="1.27" width="0.254" layer="94"/>
<wire x1="-4.445" y1="1.27" x2="-4.445" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-4.445" y1="1.27" x2="-5.715" y2="1.27" width="0.254" layer="94"/>
<wire x1="-6.985" y1="5.08" x2="4.445" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-6.985" y1="-5.08" x2="4.445" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-4.445" y1="2.54" x2="-4.445" y2="1.27" width="0.1524" layer="94"/>
<wire x1="-6.985" y1="5.08" x2="-6.985" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-4.445" y1="-1.27" x2="-4.445" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="4.445" y1="5.08" x2="4.445" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-4.445" y1="2.54" x2="-7.62" y2="2.54" width="0.1524" layer="94"/>
<wire x1="-4.445" y1="-2.54" x2="-7.62" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="2.54" y1="2.54" x2="0" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="0" x2="2.286" y2="-2.286" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="5.08" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="2.54" y1="2.54" x2="5.08" y2="2.54" width="0.1524" layer="94"/>
<wire x1="1.778" y1="-1.016" x2="2.286" y2="-2.286" width="0.1524" layer="94"/>
<wire x1="2.286" y1="-2.286" x2="2.54" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="2.286" y1="-2.286" x2="1.016" y2="-1.778" width="0.1524" layer="94"/>
<wire x1="1.016" y1="-1.778" x2="1.778" y2="-1.016" width="0.1524" layer="94"/>
<text x="-6.985" y="5.715" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.985" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="-0.381" y1="-2.54" x2="0.381" y2="2.54" layer="94"/>
<pin name="A" x="-10.16" y="2.54" visible="pad" length="short" direction="pas"/>
<pin name="C" x="-10.16" y="-2.54" visible="pad" length="short" direction="pas"/>
<pin name="EMIT" x="7.62" y="-2.54" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="COL" x="7.62" y="2.54" visible="pad" length="short" direction="pas" rot="R180"/>
</symbol>
<symbol name="R-US">
<wire x1="-2.54" y1="0" x2="-2.159" y2="1.016" width="0.2032" layer="94"/>
<wire x1="-2.159" y1="1.016" x2="-1.524" y2="-1.016" width="0.2032" layer="94"/>
<wire x1="-1.524" y1="-1.016" x2="-0.889" y2="1.016" width="0.2032" layer="94"/>
<wire x1="-0.889" y1="1.016" x2="-0.254" y2="-1.016" width="0.2032" layer="94"/>
<wire x1="-0.254" y1="-1.016" x2="0.381" y2="1.016" width="0.2032" layer="94"/>
<wire x1="0.381" y1="1.016" x2="1.016" y2="-1.016" width="0.2032" layer="94"/>
<wire x1="1.016" y1="-1.016" x2="1.651" y2="1.016" width="0.2032" layer="94"/>
<wire x1="1.651" y1="1.016" x2="2.286" y2="-1.016" width="0.2032" layer="94"/>
<wire x1="2.286" y1="-1.016" x2="2.54" y2="0" width="0.2032" layer="94"/>
<text x="-3.81" y="1.4986" size="1.778" layer="95">&gt;NAME</text>
<text x="-3.81" y="-3.302" size="1.778" layer="96">&gt;VALUE</text>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
</symbol>
<symbol name="PINHD1">
<wire x1="-6.35" y1="-2.54" x2="1.27" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="1.27" y2="2.54" width="0.4064" layer="94"/>
<wire x1="1.27" y1="2.54" x2="-6.35" y2="2.54" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="2.54" x2="-6.35" y2="-2.54" width="0.4064" layer="94"/>
<text x="-6.35" y="3.175" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
<symbol name="NPN">
<wire x1="2.54" y1="2.54" x2="0.508" y2="1.524" width="0.1524" layer="94"/>
<wire x1="1.778" y1="-1.524" x2="2.54" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="1.27" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="1.778" y2="-1.524" width="0.1524" layer="94"/>
<wire x1="1.54" y1="-2.04" x2="0.308" y2="-1.424" width="0.1524" layer="94"/>
<wire x1="1.524" y1="-2.413" x2="2.286" y2="-2.413" width="0.254" layer="94"/>
<wire x1="2.286" y1="-2.413" x2="1.778" y2="-1.778" width="0.254" layer="94"/>
<wire x1="1.778" y1="-1.778" x2="1.524" y2="-2.286" width="0.254" layer="94"/>
<wire x1="1.524" y1="-2.286" x2="1.905" y2="-2.286" width="0.254" layer="94"/>
<wire x1="1.905" y1="-2.286" x2="1.778" y2="-2.032" width="0.254" layer="94"/>
<text x="-10.16" y="7.62" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="5.08" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-2.54" x2="0.508" y2="2.54" layer="94"/>
<pin name="B" x="-2.54" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<pin name="E" x="2.54" y="-5.08" visible="off" length="short" direction="pas" swaplevel="3" rot="R90"/>
<pin name="C" x="2.54" y="5.08" visible="off" length="short" direction="pas" swaplevel="2" rot="R270"/>
</symbol>
<symbol name="C-EU">
<wire x1="0" y1="0" x2="0" y2="-0.508" width="0.1524" layer="94"/>
<wire x1="0" y1="-2.54" x2="0" y2="-2.032" width="0.1524" layer="94"/>
<text x="1.524" y="0.381" size="1.778" layer="95">&gt;NAME</text>
<text x="1.524" y="-4.699" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="-2.032" y1="-2.032" x2="2.032" y2="-1.524" layer="94"/>
<rectangle x1="-2.032" y1="-1.016" x2="2.032" y2="-0.508" layer="94"/>
<pin name="1" x="0" y="2.54" visible="off" length="short" direction="pas" swaplevel="1" rot="R270"/>
<pin name="2" x="0" y="-5.08" visible="off" length="short" direction="pas" swaplevel="1" rot="R90"/>
<text x="0" y="2.54" size="0.4064" layer="99" align="center">SpiceOrder 1</text>
<text x="0" y="-5.08" size="0.4064" layer="99" align="center">SpiceOrder 2</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="HY860H_SMD">
<gates>
<gate name="G$1" symbol="OK" x="0" y="0"/>
</gates>
<devices>
<device name="" package="HY860H_SMD">
<connects>
<connect gate="G$1" pin="A" pad="P$1"/>
<connect gate="G$1" pin="C" pad="P$2"/>
<connect gate="G$1" pin="COL" pad="P$3"/>
<connect gate="G$1" pin="EMIT" pad="P$4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="0.25W_THT_SMD">
<gates>
<gate name="G$1" symbol="R-US" x="0" y="0"/>
</gates>
<devices>
<device name="" package="0.25W_THT_SMD">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PAD">
<gates>
<gate name="G$1" symbol="PINHD1" x="0" y="0"/>
</gates>
<devices>
<device name="" package="PAD">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="NPN_THT_SMD_EBC">
<gates>
<gate name="G$1" symbol="NPN" x="0" y="0"/>
</gates>
<devices>
<device name="" package="NPN_THT_SMD_EBC">
<connects>
<connect gate="G$1" pin="B" pad="P$2"/>
<connect gate="G$1" pin="C" pad="P$3"/>
<connect gate="G$1" pin="E" pad="P$1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="0.25W_THT_SMD_SMALL">
<gates>
<gate name="G$1" symbol="R-US" x="0" y="0"/>
</gates>
<devices>
<device name="" package="0.25W_THT_SMD_SMALL">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="SMALLCAP_THT_SMD">
<gates>
<gate name="G$1" symbol="C-EU" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SMALLCAP_THT_SMD">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="OK1" library="Optical_Spark_Parts" deviceset="HY860H_SMD" device=""/>
<part name="OK2" library="Optical_Spark_Parts" deviceset="HY860H_SMD" device=""/>
<part name="R1" library="Optical_Spark_Parts" deviceset="0.25W_THT_SMD" device="" value="470"/>
<part name="P1" library="Optical_Spark_Parts" deviceset="PAD" device="" value="+12V"/>
<part name="P2" library="Optical_Spark_Parts" deviceset="PAD" device="" value="S1"/>
<part name="P3" library="Optical_Spark_Parts" deviceset="PAD" device="" value="S2"/>
<part name="P5" library="Optical_Spark_Parts" deviceset="PAD" device="" value="GND"/>
<part name="P4" library="Optical_Spark_Parts" deviceset="PAD" device="" value="T"/>
<part name="T1" library="Optical_Spark_Parts" deviceset="NPN_THT_SMD_EBC" device="" value="2N2222"/>
<part name="R2" library="Optical_Spark_Parts" deviceset="0.25W_THT_SMD_SMALL" device="" value="3.3k"/>
<part name="R3" library="Optical_Spark_Parts" deviceset="0.25W_THT_SMD_SMALL" device="" value="3.3k"/>
<part name="T2" library="Optical_Spark_Parts" deviceset="NPN_THT_SMD_EBC" device="" value="2N2222"/>
<part name="T3" library="Optical_Spark_Parts" deviceset="NPN_THT_SMD_EBC" device="" value="2N2222"/>
<part name="R4" library="Optical_Spark_Parts" deviceset="0.25W_THT_SMD" device="" value="470"/>
<part name="R5" library="Optical_Spark_Parts" deviceset="0.25W_THT_SMD" device="" value="470"/>
<part name="R6" library="Optical_Spark_Parts" deviceset="0.25W_THT_SMD" device="" value="470"/>
<part name="T4" library="Optical_Spark_Parts" deviceset="NPN_THT_SMD_EBC" device="" value="2N2222"/>
<part name="R7" library="Optical_Spark_Parts" deviceset="0.25W_THT_SMD_SMALL" device="" value="3.3k"/>
<part name="R8" library="Optical_Spark_Parts" deviceset="0.25W_THT_SMD_SMALL" device="" value="3.3k"/>
<part name="R9" library="Optical_Spark_Parts" deviceset="0.25W_THT_SMD_SMALL" device="" value="3.3k"/>
<part name="C1" library="Optical_Spark_Parts" deviceset="SMALLCAP_THT_SMD" device="" value="1uF"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="OK1" gate="G$1" x="20.32" y="66.04" smashed="yes">
<attribute name="NAME" x="13.335" y="71.755" size="1.778" layer="95"/>
<attribute name="VALUE" x="13.335" y="58.42" size="1.778" layer="96"/>
</instance>
<instance part="OK2" gate="G$1" x="20.32" y="38.1" smashed="yes">
<attribute name="NAME" x="13.335" y="43.815" size="1.778" layer="95"/>
<attribute name="VALUE" x="13.335" y="30.48" size="1.778" layer="96"/>
</instance>
<instance part="R1" gate="G$1" x="0" y="53.34" smashed="yes" rot="R90">
<attribute name="NAME" x="-1.4986" y="49.53" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="3.302" y="49.53" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="P1" gate="G$1" x="210.82" y="20.32" smashed="yes">
<attribute name="NAME" x="212.09" y="20.955" size="1.778" layer="95"/>
<attribute name="VALUE" x="212.09" y="17.78" size="1.778" layer="96"/>
</instance>
<instance part="P2" gate="G$1" x="210.82" y="12.7" smashed="yes">
<attribute name="NAME" x="212.09" y="13.335" size="1.778" layer="95"/>
<attribute name="VALUE" x="212.09" y="10.16" size="1.778" layer="96"/>
</instance>
<instance part="P3" gate="G$1" x="210.82" y="5.08" smashed="yes">
<attribute name="NAME" x="212.09" y="5.715" size="1.778" layer="95"/>
<attribute name="VALUE" x="212.09" y="2.54" size="1.778" layer="96"/>
</instance>
<instance part="P5" gate="G$1" x="210.82" y="-10.16" smashed="yes">
<attribute name="NAME" x="212.09" y="-9.525" size="1.778" layer="95"/>
<attribute name="VALUE" x="212.09" y="-12.7" size="1.778" layer="96"/>
</instance>
<instance part="P4" gate="G$1" x="210.82" y="-2.54" smashed="yes">
<attribute name="NAME" x="212.09" y="-1.905" size="1.778" layer="95"/>
<attribute name="VALUE" x="212.09" y="-5.08" size="1.778" layer="96"/>
</instance>
<instance part="T1" gate="G$1" x="165.1" y="7.62" smashed="yes">
<attribute name="NAME" x="157.48" y="2.54" size="1.778" layer="95"/>
<attribute name="VALUE" x="157.48" y="0" size="1.778" layer="96"/>
</instance>
<instance part="R2" gate="G$1" x="33.02" y="0" smashed="yes" rot="R90">
<attribute name="NAME" x="31.5214" y="-3.81" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="36.322" y="-3.81" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R3" gate="G$1" x="50.8" y="0" smashed="yes" rot="R90">
<attribute name="NAME" x="49.3014" y="-3.81" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="54.102" y="-3.81" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="T2" gate="G$1" x="66.04" y="7.62" smashed="yes">
<attribute name="NAME" x="58.42" y="2.54" size="1.778" layer="95"/>
<attribute name="VALUE" x="58.42" y="0" size="1.778" layer="96"/>
</instance>
<instance part="T3" gate="G$1" x="78.74" y="22.86" smashed="yes">
<attribute name="NAME" x="71.12" y="17.78" size="1.778" layer="95"/>
<attribute name="VALUE" x="71.12" y="15.24" size="1.778" layer="96"/>
</instance>
<instance part="R4" gate="G$1" x="68.58" y="63.5" smashed="yes" rot="R90">
<attribute name="NAME" x="67.0814" y="59.69" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="71.882" y="59.69" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R5" gate="G$1" x="81.28" y="63.5" smashed="yes" rot="R90">
<attribute name="NAME" x="79.7814" y="59.69" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="84.582" y="59.69" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R6" gate="G$1" x="134.62" y="60.96" smashed="yes" rot="R90">
<attribute name="NAME" x="133.1214" y="57.15" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="137.922" y="57.15" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="T4" gate="G$1" x="132.08" y="17.78" smashed="yes">
<attribute name="NAME" x="124.46" y="12.7" size="1.778" layer="95"/>
<attribute name="VALUE" x="124.46" y="10.16" size="1.778" layer="96"/>
</instance>
<instance part="R7" gate="G$1" x="134.62" y="-2.54" smashed="yes" rot="R90">
<attribute name="NAME" x="133.1214" y="-6.35" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="137.922" y="-6.35" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R8" gate="G$1" x="99.06" y="30.48" smashed="yes" rot="R90">
<attribute name="NAME" x="97.5614" y="26.67" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="102.362" y="26.67" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R9" gate="G$1" x="109.22" y="30.48" smashed="yes" rot="R90">
<attribute name="NAME" x="107.7214" y="26.67" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="112.522" y="26.67" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="C1" gate="G$1" x="142.24" y="-2.54" smashed="yes">
<attribute name="NAME" x="143.764" y="-2.159" size="1.778" layer="95"/>
<attribute name="VALUE" x="143.764" y="-7.239" size="1.778" layer="96"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<pinref part="OK1" gate="G$1" pin="C"/>
<wire x1="10.16" y1="63.5" x2="0" y2="63.5" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="2"/>
<wire x1="0" y1="63.5" x2="0" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="OK2" gate="G$1" pin="A"/>
<wire x1="10.16" y1="40.64" x2="0" y2="40.64" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="1"/>
<wire x1="0" y1="40.64" x2="0" y2="48.26" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="P5" gate="G$1" pin="1"/>
<wire x1="208.28" y1="-10.16" x2="167.64" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="T1" gate="G$1" pin="E"/>
<wire x1="167.64" y1="2.54" x2="167.64" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="OK2" gate="G$1" pin="C"/>
<wire x1="10.16" y1="35.56" x2="0" y2="35.56" width="0.1524" layer="91"/>
<wire x1="0" y1="35.56" x2="0" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="167.64" y1="-10.16" x2="142.24" y2="-10.16" width="0.1524" layer="91"/>
<junction x="167.64" y="-10.16"/>
<pinref part="R2" gate="G$1" pin="1"/>
<wire x1="142.24" y1="-10.16" x2="134.62" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="134.62" y1="-10.16" x2="81.28" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="81.28" y1="-10.16" x2="68.58" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="68.58" y1="-10.16" x2="50.8" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="50.8" y1="-10.16" x2="33.02" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="33.02" y1="-10.16" x2="0" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="33.02" y1="-5.08" x2="33.02" y2="-10.16" width="0.1524" layer="91"/>
<junction x="33.02" y="-10.16"/>
<pinref part="R3" gate="G$1" pin="1"/>
<wire x1="50.8" y1="-5.08" x2="50.8" y2="-10.16" width="0.1524" layer="91"/>
<junction x="50.8" y="-10.16"/>
<pinref part="T2" gate="G$1" pin="E"/>
<wire x1="68.58" y1="2.54" x2="68.58" y2="-10.16" width="0.1524" layer="91"/>
<junction x="68.58" y="-10.16"/>
<pinref part="T3" gate="G$1" pin="E"/>
<wire x1="81.28" y1="17.78" x2="81.28" y2="-10.16" width="0.1524" layer="91"/>
<junction x="81.28" y="-10.16"/>
<pinref part="R7" gate="G$1" pin="1"/>
<wire x1="134.62" y1="-7.62" x2="134.62" y2="-10.16" width="0.1524" layer="91"/>
<junction x="134.62" y="-10.16"/>
<pinref part="C1" gate="G$1" pin="2"/>
<wire x1="142.24" y1="-7.62" x2="142.24" y2="-10.16" width="0.1524" layer="91"/>
<junction x="142.24" y="-10.16"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="T1" gate="G$1" pin="C"/>
<wire x1="167.64" y1="12.7" x2="167.64" y2="20.32" width="0.1524" layer="91"/>
<wire x1="167.64" y1="20.32" x2="175.26" y2="20.32" width="0.1524" layer="91"/>
<pinref part="P4" gate="G$1" pin="1"/>
<wire x1="208.28" y1="-2.54" x2="175.26" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="175.26" y1="-2.54" x2="175.26" y2="20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="T1" gate="G$1" pin="B"/>
<pinref part="T4" gate="G$1" pin="E"/>
<wire x1="134.62" y1="12.7" x2="134.62" y2="7.62" width="0.1524" layer="91"/>
<wire x1="134.62" y1="7.62" x2="142.24" y2="7.62" width="0.1524" layer="91"/>
<pinref part="R7" gate="G$1" pin="2"/>
<wire x1="142.24" y1="7.62" x2="162.56" y2="7.62" width="0.1524" layer="91"/>
<wire x1="134.62" y1="7.62" x2="134.62" y2="2.54" width="0.1524" layer="91"/>
<junction x="134.62" y="7.62"/>
<pinref part="C1" gate="G$1" pin="1"/>
<wire x1="142.24" y1="0" x2="142.24" y2="7.62" width="0.1524" layer="91"/>
<junction x="142.24" y="7.62"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="P1" gate="G$1" pin="1"/>
<wire x1="208.28" y1="20.32" x2="198.12" y2="20.32" width="0.1524" layer="91"/>
<wire x1="198.12" y1="20.32" x2="198.12" y2="106.68" width="0.1524" layer="91"/>
<pinref part="OK2" gate="G$1" pin="COL"/>
<wire x1="27.94" y1="40.64" x2="33.02" y2="40.64" width="0.1524" layer="91"/>
<pinref part="OK1" gate="G$1" pin="A"/>
<wire x1="10.16" y1="68.58" x2="0" y2="68.58" width="0.1524" layer="91"/>
<wire x1="0" y1="68.58" x2="0" y2="106.68" width="0.1524" layer="91"/>
<wire x1="0" y1="106.68" x2="33.02" y2="106.68" width="0.1524" layer="91"/>
<pinref part="OK1" gate="G$1" pin="COL"/>
<wire x1="27.94" y1="68.58" x2="33.02" y2="68.58" width="0.1524" layer="91"/>
<wire x1="33.02" y1="68.58" x2="33.02" y2="106.68" width="0.1524" layer="91"/>
<wire x1="33.02" y1="40.64" x2="33.02" y2="68.58" width="0.1524" layer="91"/>
<junction x="33.02" y="68.58"/>
<wire x1="198.12" y1="106.68" x2="134.62" y2="106.68" width="0.1524" layer="91"/>
<junction x="33.02" y="106.68"/>
<pinref part="R4" gate="G$1" pin="2"/>
<wire x1="134.62" y1="106.68" x2="81.28" y2="106.68" width="0.1524" layer="91"/>
<wire x1="81.28" y1="106.68" x2="68.58" y2="106.68" width="0.1524" layer="91"/>
<wire x1="68.58" y1="106.68" x2="33.02" y2="106.68" width="0.1524" layer="91"/>
<wire x1="68.58" y1="68.58" x2="68.58" y2="106.68" width="0.1524" layer="91"/>
<junction x="68.58" y="106.68"/>
<pinref part="R5" gate="G$1" pin="2"/>
<wire x1="81.28" y1="68.58" x2="81.28" y2="106.68" width="0.1524" layer="91"/>
<junction x="81.28" y="106.68"/>
<pinref part="R6" gate="G$1" pin="2"/>
<wire x1="134.62" y1="66.04" x2="134.62" y2="106.68" width="0.1524" layer="91"/>
<junction x="134.62" y="106.68"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="OK2" gate="G$1" pin="EMIT"/>
<wire x1="27.94" y1="35.56" x2="33.02" y2="35.56" width="0.1524" layer="91"/>
<pinref part="R2" gate="G$1" pin="2"/>
<wire x1="33.02" y1="35.56" x2="33.02" y2="7.62" width="0.1524" layer="91"/>
<pinref part="T2" gate="G$1" pin="B"/>
<wire x1="33.02" y1="7.62" x2="33.02" y2="5.08" width="0.1524" layer="91"/>
<wire x1="63.5" y1="7.62" x2="33.02" y2="7.62" width="0.1524" layer="91"/>
<junction x="33.02" y="7.62"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="OK1" gate="G$1" pin="EMIT"/>
<pinref part="R3" gate="G$1" pin="2"/>
<wire x1="27.94" y1="63.5" x2="50.8" y2="63.5" width="0.1524" layer="91"/>
<wire x1="50.8" y1="63.5" x2="50.8" y2="22.86" width="0.1524" layer="91"/>
<pinref part="T3" gate="G$1" pin="B"/>
<wire x1="50.8" y1="22.86" x2="50.8" y2="5.08" width="0.1524" layer="91"/>
<wire x1="76.2" y1="22.86" x2="50.8" y2="22.86" width="0.1524" layer="91"/>
<junction x="50.8" y="22.86"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="T3" gate="G$1" pin="C"/>
<pinref part="R5" gate="G$1" pin="1"/>
<wire x1="81.28" y1="27.94" x2="81.28" y2="48.26" width="0.1524" layer="91"/>
<wire x1="81.28" y1="48.26" x2="81.28" y2="58.42" width="0.1524" layer="91"/>
<pinref part="P2" gate="G$1" pin="1"/>
<wire x1="190.5" y1="48.26" x2="190.5" y2="12.7" width="0.1524" layer="91"/>
<wire x1="190.5" y1="12.7" x2="208.28" y2="12.7" width="0.1524" layer="91"/>
<wire x1="81.28" y1="48.26" x2="109.22" y2="48.26" width="0.1524" layer="91"/>
<junction x="81.28" y="48.26"/>
<pinref part="R9" gate="G$1" pin="2"/>
<wire x1="109.22" y1="48.26" x2="190.5" y2="48.26" width="0.1524" layer="91"/>
<wire x1="109.22" y1="35.56" x2="109.22" y2="48.26" width="0.1524" layer="91"/>
<junction x="109.22" y="48.26"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="R4" gate="G$1" pin="1"/>
<pinref part="T2" gate="G$1" pin="C"/>
<wire x1="68.58" y1="58.42" x2="68.58" y2="40.64" width="0.1524" layer="91"/>
<pinref part="P3" gate="G$1" pin="1"/>
<wire x1="68.58" y1="40.64" x2="68.58" y2="12.7" width="0.1524" layer="91"/>
<wire x1="182.88" y1="40.64" x2="182.88" y2="5.08" width="0.1524" layer="91"/>
<wire x1="182.88" y1="5.08" x2="208.28" y2="5.08" width="0.1524" layer="91"/>
<wire x1="68.58" y1="40.64" x2="99.06" y2="40.64" width="0.1524" layer="91"/>
<junction x="68.58" y="40.64"/>
<pinref part="R8" gate="G$1" pin="2"/>
<wire x1="99.06" y1="40.64" x2="182.88" y2="40.64" width="0.1524" layer="91"/>
<wire x1="99.06" y1="35.56" x2="99.06" y2="40.64" width="0.1524" layer="91"/>
<junction x="99.06" y="40.64"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="R6" gate="G$1" pin="1"/>
<pinref part="T4" gate="G$1" pin="C"/>
<wire x1="134.62" y1="55.88" x2="134.62" y2="22.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="R9" gate="G$1" pin="1"/>
<wire x1="109.22" y1="25.4" x2="109.22" y2="17.78" width="0.1524" layer="91"/>
<pinref part="T4" gate="G$1" pin="B"/>
<wire x1="109.22" y1="17.78" x2="129.54" y2="17.78" width="0.1524" layer="91"/>
<pinref part="R8" gate="G$1" pin="1"/>
<wire x1="99.06" y1="25.4" x2="99.06" y2="17.78" width="0.1524" layer="91"/>
<wire x1="99.06" y1="17.78" x2="109.22" y2="17.78" width="0.1524" layer="91"/>
<junction x="109.22" y="17.78"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
