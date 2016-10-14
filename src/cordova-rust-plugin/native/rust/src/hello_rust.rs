#![crate_type = "staticlib"]

extern crate time;
use std::os::raw::c_char;
use std::ffi::CString;
use time::*;

#[no_mangle]
pub extern "C" fn add(lhs: u32, rhs: u32) -> u32 {
	lhs + rhs
}

#[no_mangle]
pub extern "C" fn hello() -> *const c_char {
	let date_string = strftime("%F", &now()).unwrap();
	let c_to_print = CString::new(date_string.into_bytes()).unwrap();
	c_to_print.as_ptr()
}
