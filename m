Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFAC930DA3
	for <lists+nouveau@lfdr.de>; Mon, 15 Jul 2024 07:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7BD10E22A;
	Mon, 15 Jul 2024 05:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iy2UdCZH";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9CC010E178
 for <nouveau@lists.freedesktop.org>; Mon, 15 Jul 2024 05:35:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DE943CE0B28;
 Mon, 15 Jul 2024 05:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5407FC4AF0C;
 Mon, 15 Jul 2024 05:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1721021720;
 bh=23WVQytlsylhbvxlQYuds0lP2VtzWIhTTgtqfdPH29o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iy2UdCZHqRcCdoKcJTRLMDVSnkjG+Xex9X8HTKKJYHrjK8RHNBUnRu0DFbYVgx3Gc
 xERkEqqR+hutyEkvQkWM8YaBb/6823P8dEOQubX4aMDiHn97+/yjrKKqpqaVb/6zNa
 RDDOhpe9OZ2tJrpcFDRjjwynZ3jeQGCvKCz8pJuQ=
Date: Mon, 15 Jul 2024 07:35:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Karol Herbst <karolherbst@gmail.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: MODULE_DESCRIPTION() patches with no maintainer action
Message-ID: <2024071518-ridden-election-8118@gregkh>
References: <2d168cf9-e456-4262-b276-95e992b8eac7@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d168cf9-e456-4262-b276-95e992b8eac7@quicinc.com>
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

On Sun, Jul 14, 2024 at 02:46:19PM -0700, Jeff Johnson wrote:
> Andrew & Greg,
> 
> I hate to bother you with such mundane patches, but the following have been
> posted for a while without any maintainer or reviewer comment or action, and
> they have not yet landed in linux-next.
> 
> What is the path forward to have these MODULE_DESCRIPTION() warnings fixed?
> 
> arch/arm/probes/kprobes/
> https://lore.kernel.org/all/20240622-md-arm-arch-arm-probes-kprobes-v1-1-0832bd6e45db@quicinc.com/
> 
> arch/x86/mm/
> https://lore.kernel.org/all/20240515-testmmiotrace-md-v1-1-10919a8b2842@quicinc.com/
> 
> drivers/spmi/
> https://lore.kernel.org/all/20240609-md-drivers-spmi-v1-1-f1d5b24e7a66@quicinc.com/
> 
> (note that beyond these 3 patches I still have an additional 13 patches which
> need to land in order to fix these warnings tree-wide, but those 13 patches
> have had recent maintainer or reviewer action so I'm not seeking your help at
> this time).

After -rc1 is out, resend them all as a series and cc: the right people
and either me or Andrew can pick them up then and get them merged in
before -final is released.

thanks,

greg k-h
