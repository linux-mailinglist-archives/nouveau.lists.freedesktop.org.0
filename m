Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3D1A68C8D
	for <lists+nouveau@lfdr.de>; Wed, 19 Mar 2025 13:14:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8751E10E30B;
	Wed, 19 Mar 2025 12:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fvuxVfkl";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3EE10E30B
 for <nouveau@lists.freedesktop.org>; Wed, 19 Mar 2025 12:14:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E8C86A490B1;
 Wed, 19 Mar 2025 12:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F72C4CEE9;
 Wed, 19 Mar 2025 12:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742386443;
 bh=ZwisKtmR+BtAGPQjAwwHEIB8ijkggU8e+q8ExATUOVE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fvuxVfkltStMgvNNLMy5/sWPBNLk695F36DgnOOk8BakMZxomVS6bitq8r6pWcrc6
 8UQzW0rPBcW93jM0+ySaBcPIcrNvW/AL+G14JVbD7gEgX/MzkAitzdfB929EkEuuVE
 yYDAZFtgH99iwEvY+UeW49dOk7SZXKOY7bA99bzGOgSHMlcTHvlDs1FafyMm+XYNhD
 Ub6Qx9vAooEdUT+sW/10pZyZfMgJgUkkHgn509iMdD6ochTCNyDS+i0nmYi+FSHra6
 QUCYa04IC6QyS++vqg8gPwzgBQ6yk5CQ4ViDFMa4gJrdTokRTJJ2hhv28p7MfXUCwH
 cpnFa6DnV91MQ==
Date: Wed, 19 Mar 2025 21:13:58 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Naveen Kumar P <naveenkumar.parna@gmail.com>
Cc: rostedt@goodmis.org, mhiramat@kernel.org, karolherbst@gmail.com,
 ppaalanen@gmail.com, dave.hansen@linux.intel.com, luto@kernel.org, Peter
 Zijlstra <peterz@infradead.org>, nouveau@lists.freedesktop.org
Subject: Re: Debugging PCIe Configuration Space Using mmiotrace
Message-Id: <20250319211358.493f01a50ba2dff38651b3f4@kernel.org>
In-Reply-To: <CAMciSVXGcF=mT0UgU8cNTLiDTUovOYSL=cX95b9Wr1u3UwWNWQ@mail.gmail.com>
References: <CAMciSVXGcF=mT0UgU8cNTLiDTUovOYSL=cX95b9Wr1u3UwWNWQ@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Hi,

On Tue, 18 Mar 2025 23:53:34 +0530
Naveen Kumar P <naveenkumar.parna@gmail.com> wrote:

> Hi all,
> 
> I am currently debugging an issue on an x86 machine running the latest
> Linux kernel, involving a PCIe device whose memory is mapped via BAR0.
> I am encountering unexpected behavior when reading its PCI
> configuration space using lspci, and I am seeking guidance on whether
> mmiotrace can help diagnose the problem.

AFAIK, mmiotrace is tracing mmio operation from CPU side. That
traces what data the driver is writing where, and what data is read
from where.

> 
> Issue Summary:
> Expected Behavior After Boot:
> lspci -xxx -s 01:00.0 correctly displays valid PCI configuration space
> values, including a properly mapped BAR0.
> 
> $ sudo lspci -xxx -s 01:00.0 | grep "10:"
> 10: 00 00 40 b0 00 00 00 00 00 00 00 00 00 00 00 00
> 
> 
> Unexpected Behavior After Uptime:
> After a few days, reading the PCI configuration space (lspci -xxx -s
> 01:00.0) sometimes returns all 0xffs for the entire config space.
> dmesg does not log any relevant errors.
> 

Hmm, the below problem seems device side issue (especially 9xffff
means failed to read the PCI bus, IIRC.) 

> $ sudo lspci -xxx -s 01:00.0
> 01:00.0 RAM memory: PLDA Device 5555 (rev ff)
> 00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 10: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 20: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 30: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 40: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 50: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 60: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 70: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 90: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 
> 
> After Subsequent Reads:
> Re-running lspci -xxx -s 01:00.0 restores non-0xff values, but BAR0
> gets reset to zero.
> 
> $ sudo lspci -xxx -s 01:00.0
> 01:00.0 RAM memory: PLDA Device 5555
> 00: 56 15 55 55 00 00 10 00 00 00 00 05 00 00 00 00
> 10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 20: 00 00 00 00 00 00 00 00 00 00 00 00 00 40 00 00
> 30: 00 00 00 00 40 00 00 00 00 00 00 00 ff 01 00 00
> 40: 01 48 03 00 08 00 00 00 05 60 00 00 00 00 00 00
> 50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 60: 10 00 02 00 c2 8f 00 00 10 28 01 00 21 f4 03 00
> 70: 00 00 21 00 00 00 00 00 00 00 00 00 00 00 00 00
> 80: 00 00 00 00 02 00 00 00 00 00 00 00 00 00 00 00
> 90: 20 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00
> a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 
> This suggests that some function or driver is resetting BAR0 during or
> after a failed config space read.
> 
> 
> mmiotrace Setup & Results:
> I have enabled mmiotrace and verified it is active:
> # cat /sys/kernel/tracing/available_tracers
> hwlat blk mmiotrace function_graph wakeup_dl wakeup_rt wakeup function nop
> 
> # cat current_tracer
> mmiotrace
> 
> However, trace_pipe and trace logs remain empty even after reproducing
> the issue:
> 
> # cat trace_pipe
> VERSION 20070824
> PCIDEV 0000 80860f00 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 iosf_mbi_pci
> PCIDEV 0010 80860f31 61 b0000000 0 a0000008 0 e081 0 c0002 400000 0
> 10000000 0 8 0 20000 i915
> PCIDEV 0098 80860f23 5b e071 e061 e051 e041 e021 b0b17000 0 8 4 8 4 20
> 800 0 ahci
> PCIDEV 00a0 80860f35 5a b0b00004 0 0 0 0 0 0 10000 0 0 0 0 0 0 xhci_hcd
> PCIDEV 00b8 80860f50 17 b0b16000 b0b15000 0 0 0 0 0 1000 1000 0 0 0 0
> 0 sdhci-pci
> PCIDEV 00d0 80860f18 62 b0900000 b0800000 0 0 0 0 0 100000 100000 0 0
> 0 0 0 mei_txe
> PCIDEV 00d8 80860f04 16 b0b10004 0 0 0 0 0 0 4000 0 0 0 0 0 0 snd_hda_intel
> PCIDEV 00e0 80860f48 57 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pcieport
> PCIDEV 00e2 80860f4c 58 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pcieport
> PCIDEV 00e3 80860f4e 59 0 0 0 0 0 0 0 0 0 0 0 0 0 0 pcieport
> PCIDEV 00f8 80860f1c 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 lpc_ich
> PCIDEV 00fb 80860f12 12 b0b14000 0 0 0 e001 0 0 20 0 0 0 20 0 0 i801_smbus
> PCIDEV 0100 15565555 b b0400000 0 0 0 0 0 0 400000 0 0 0 0 0 0
> PCIDEV 0300 80861533 13 b0a00000 0 d001 b0a80000 0 0 0 80000 0 20 4000 0 0 0 igb

Note that once you read the `trace_pipe` file, the trace data is consumed
and erased (technically, it is not ereased but you can not access it anymore.)

> 
> cat trace
> # tracer: mmiotrace
> #
> # entries-in-buffer/entries-written: 0/0   #P:1
> #
> #                                _-----=> irqs-off/BH-disabled
> #                               / _----=> need-resched
> #                              | / _---=> hardirq/softirq
> #                              || / _--=> preempt-depth
> #                              ||| / _-=> migrate-disable
> #                              |||| /     delay
> #           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
> #              | |         |   |||||     |         |

Thus after reading `trace_pipe`, the `trace` file must be empty.
If you want to read it multiple times, you need to use `trace` file always.

> 
> 
> Request for Assistance:
> Can mmiotrace help determine the root cause of why reading the PCI
> configuration space results in all 0xffs?

As I said, this seems device side or bus side issue. mmiotrace may
not directly help, but you can explain what the software does to the
hardware people.

Thank you,

> 
> Is there a way to determine what function or driver is clearing BAR0
> when the values are restored?
> 
> If mmiotrace is suitable for this, how can I properly capture the
> relevant trace data to analyze this issue?
> 
> Any insights or suggestions would be greatly appreciated. Please let
> me know if you
> need more details.
> 
> Best regards,
> Naveen


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
