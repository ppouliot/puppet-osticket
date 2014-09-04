# osticket

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Contributors - Who contributed](#Contributors)
6. [Licence - Guide for contributing to the module](#development)

## Overview

This puppet module installs the opensource ticketing system osTicket.
Additional information about osTicket can be found here.

  * http://osticket.com

The developer has no affiliation with osticket.com.  This software is provided asis so use at your own risk.

## Module Description

This basically installs the complete LAMP stack required for running osTicket.
Additionally all code is retrieved from the GitHub sources.

## Usage

  class{'osticket'}

## Reference

   url: http://osticket.com/wiki/Main_Page

   
## Contributors

 * Peter Pouliot <peter@pouliot.net>

## Copyright and License

Copyright (C) 2014 Peter J. Pouliot

Peter Pouliot can be contacted at: peter@pouliot.net

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

