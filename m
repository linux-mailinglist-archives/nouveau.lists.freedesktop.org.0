Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F827D8E30
	for <lists+nouveau@lfdr.de>; Fri, 27 Oct 2023 07:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BA010E921;
	Fri, 27 Oct 2023 05:35:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6091B10E921
 for <nouveau@lists.freedesktop.org>; Fri, 27 Oct 2023 05:35:12 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gcfxn-nouveau@m.gmane-mx.org>) id 1qwFV0-0007EP-3b
 for nouveau@lists.freedesktop.org; Fri, 27 Oct 2023 07:35:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: nouveau@lists.freedesktop.org
From: Timothy Maden <terminatorul@gmail.com>
Date: Fri, 27 Oct 2023 08:35:05 +0300
Message-ID: <uhfi69$eil$1@ciao.gmane.io>
References: <CA+rFky5Swae3E7jtEi-abHHd9VJ+WaQhqM99L5zP0_r-T_Yneg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla Thunderbird
Content-Language: en-US
In-Reply-To: <CA+rFky5Swae3E7jtEi-abHHd9VJ+WaQhqM99L5zP0_r-T_Yneg@mail.gmail.com>
Subject: Re: [Nouveau] How to enable OpenCL device in Clover ?
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 10/23/23 20:54, Andrew Randrianasulu wrote:
> I think you can use
> NOUVEAU_ENABLE_CL=1 clpeak for example
> 
> it skips memory-hungry bandwidth test but then runs partially:
> 
> Platform: Clover
>    Device: NV106
>      Driver version  : 23.3.0-devel (Linux x86)
>      Compute units   : 1
>      Clock frequency : 512 MHz
> SPIR-V WARNING:
>      In file ../src/compiler/spirv/spirv_to_nir.c:4681
>      Unsupported SPIR-V capability: SpvCapabilityLinkage (5)
>      28 bytes into the SPIR-V binary
> 
>      Global memory bandwidth (GBPS)
>        float   : nve4_launch_grid:905 - Failed to launch grid !
> 
> [..]
> 
> Single-precision compute (GFLOPS)
>        float   : 80.74
>        float2  : 41.38
>        float4  : 50.49
>        float8  : 51.32
>        float16 : 53.58
> 
> on unreclocked NVIDIA GK208B (2gb ddr3 memory - ha!)

Oh, thank you !

Maybe this variable should be documented, like for example the new 
variable I_WANT_A_BROKEN_VULKAN_DRIVER is documented.

I have a GK208B chip, that I replaced with a GA102.

When I try to use the OpenCL device I get the following error on GA102:

     Build Log: <built-in>:1:10: fatal error: 'opencl-c.h' file not found

this happens with both Mesa 23.2.1 and latest Mesa 24.0.0-devel from git.

The missing header in the message is found in clang-libs package on 
Fedora for example, and if I add the needed -I flag to clBuildProgram(), 
the error goes away. So it looks like a missing include directory inside 
Clover ... ?

Unfortunately I can not add the missing -I flag to OpenCL compiler when 
using clpeak or LuxMark ... without recompiling. Is there an environment 
variable or some other way ?

--
Thank you,
Timothy Madden

