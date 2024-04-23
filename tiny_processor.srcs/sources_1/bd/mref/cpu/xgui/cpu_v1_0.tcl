# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "DECODE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "EXECUTE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FETCH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HALTED" -parent ${Page_0}
  ipgui::add_param $IPINST -name "addr" -parent ${Page_0}


}

proc update_PARAM_VALUE.DECODE { PARAM_VALUE.DECODE } {
	# Procedure called to update DECODE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DECODE { PARAM_VALUE.DECODE } {
	# Procedure called to validate DECODE
	return true
}

proc update_PARAM_VALUE.EXECUTE { PARAM_VALUE.EXECUTE } {
	# Procedure called to update EXECUTE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EXECUTE { PARAM_VALUE.EXECUTE } {
	# Procedure called to validate EXECUTE
	return true
}

proc update_PARAM_VALUE.FETCH { PARAM_VALUE.FETCH } {
	# Procedure called to update FETCH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FETCH { PARAM_VALUE.FETCH } {
	# Procedure called to validate FETCH
	return true
}

proc update_PARAM_VALUE.HALTED { PARAM_VALUE.HALTED } {
	# Procedure called to update HALTED when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HALTED { PARAM_VALUE.HALTED } {
	# Procedure called to validate HALTED
	return true
}

proc update_PARAM_VALUE.addr { PARAM_VALUE.addr } {
	# Procedure called to update addr when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.addr { PARAM_VALUE.addr } {
	# Procedure called to validate addr
	return true
}


proc update_MODELPARAM_VALUE.addr { MODELPARAM_VALUE.addr PARAM_VALUE.addr } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.addr}] ${MODELPARAM_VALUE.addr}
}

proc update_MODELPARAM_VALUE.FETCH { MODELPARAM_VALUE.FETCH PARAM_VALUE.FETCH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FETCH}] ${MODELPARAM_VALUE.FETCH}
}

proc update_MODELPARAM_VALUE.DECODE { MODELPARAM_VALUE.DECODE PARAM_VALUE.DECODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DECODE}] ${MODELPARAM_VALUE.DECODE}
}

proc update_MODELPARAM_VALUE.EXECUTE { MODELPARAM_VALUE.EXECUTE PARAM_VALUE.EXECUTE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EXECUTE}] ${MODELPARAM_VALUE.EXECUTE}
}

proc update_MODELPARAM_VALUE.HALTED { MODELPARAM_VALUE.HALTED PARAM_VALUE.HALTED } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HALTED}] ${MODELPARAM_VALUE.HALTED}
}

