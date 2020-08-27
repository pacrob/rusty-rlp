use crate::DecodingError;
use pyo3::prelude::*;
use rlp::PayloadInfo;

pub fn construct_invariant_error<T>() -> Result<T, PyErr> {
    Err(DecodingError::py_err("Invariant"))
}

pub fn construct_trailing_bytes_error<T>(payload_info: &PayloadInfo) -> Result<T, PyErr> {
    Err(DecodingError::py_err(format!(
        "Trailing bytes. Payload Info {:?}",
        payload_info
    )))
}