Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF8F91B77A
	for <lists+nouveau@lfdr.de>; Fri, 28 Jun 2024 09:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E66110E11F;
	Fri, 28 Jun 2024 07:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="pNnAviyq";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3231C88647
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jun 2024 07:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1719558171;
 bh=yKAZtPM5GEr7CZjyMumaDPYIdeEdVpmcv/sFYuGOa9Q=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pNnAviyq9uqhUftQyMYSIpMi22zRA/e2RLe2mk9dsbBulBptFighU+2xzZhq57gN4
 W8OHDxJFhAozwDw9+r+KGMRvHmaBzqQ5wv/saWrhEZrSMY7vNOHytT29zPfM17nKsA
 j/wF2y89PcCRCzBZeMvVvi6ofDNLtmKxmpFR9QR1yxuxnDNHXBIB2UU8+KumhVa1MG
 zHu8Ww8Fm1TIpYRBTNoBEuHRTYf6MHs+VZveXwM/fsmdMgoL94c5+Wcqn6K3Mm/Zme
 DRx6CypwoAKrLlnVrNXssY7rU/lzEcYngKoMJ7sauDbdNypraPrNybVkum3rD7EQtb
 KXBRZe+7BCJXg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4W9RGK5Rg0z4w2N;
 Fri, 28 Jun 2024 17:02:49 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jialong Yang <jialong.yang@shingroup.cn>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Cc: luming.yu@shingroup.cn, shenghui.qu@shingroup.cn, Jialong Yang
 <jialong.yang@shingroup.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Karol Herbst <karolherbst@gmail.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v1 1/2] powerpc/mmiotrace: Add MMIO Tracing tool for
 PowerPC
In-Reply-To: <2bf90acf7d29641ba6643934ff8dbba897dbd2d9.1718873074.git.jialong.yang@shingroup.cn>
References: <2bf90acf7d29641ba6643934ff8dbba897dbd2d9.1718873074.git.jialong.yang@shingroup.cn>
Date: Fri, 28 Jun 2024 17:02:48 +1000
Message-ID: <87h6ddlfc7.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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

Jialong Yang <jialong.yang@shingroup.cn> writes:
> mmiotrace is a useful tool to trace MMIO accesses. Nowadays, it only
> supported on x86 and x86_64 platforms.

I've never used mmiotrace, and don't know it well.

I'm not necessarily opposed to merging it, but AFAIK it was mostly used
for reverse engineering proprietary drivers, where the driver itself
couldn't be easily instrumented. Is that what you're using it for?

For drivers where we have the source wouldn't it be easier to just use
tracepoints in the MMIO accessors?

Is it still in-use/maintained on the x86 side?

> Here is a support for powerpc.
> The manual is located at Documentation/trace/mmiotrace.rst which means
> I have not changed user API. People will be easy to use it.
> Almost all files are copied from x86/mm, there are only some
> differences from hardware and architectures software.
>
> LINK: https://lore.kernel.org/lkml/20080127195536.50809974@daedalus.pq.iki.fi/
>
> Signed-off-by: Jialong Yang <jialong.yang@shingroup.cn>
> ---
>  arch/powerpc/Kconfig.debug       |   3 +
>  arch/powerpc/mm/Makefile         |   1 +
>  arch/powerpc/mm/kmmio.c          | 649 +++++++++++++++++++++++++++++++
>  arch/powerpc/mm/mmio-mod.c       | 414 ++++++++++++++++++++
>  arch/powerpc/mm/mmiotrace_arch.c | 149 +++++++
>  arch/powerpc/mm/mmiotrace_arch.h |  25 ++
>  arch/powerpc/mm/pf_in.c          | 185 +++++++++
>  arch/powerpc/mm/pf_in.h          |  33 ++
>  8 files changed, 1459 insertions(+)
  
At a glance most of that code could be shared between arches. I don't
think I can merge that as-is, without some attempt to split the generic
parts out.

cheers
