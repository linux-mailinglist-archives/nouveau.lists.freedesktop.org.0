Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DAAC81228
	for <lists+nouveau@lfdr.de>; Mon, 24 Nov 2025 15:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABDA10E2D8;
	Mon, 24 Nov 2025 14:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="TzKctMUe";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3905F10E2D8
 for <nouveau@lists.freedesktop.org>; Mon, 24 Nov 2025 14:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=T6qo3JM9edKF9yotTrqC4KSWMlApaFYSQyRMCU7A0QQ=; b=TzKctMUePuak9AjKx6VCue/cUf
 NGK3H/RvKt7isPtkb8XB163+z/iiJ28CRVy1LxLAqSONdk0XyC4/2jadqhXmJ8ExM6Y10IcKePMDb
 nDi9cMY3LdUjnPrc32RaCOaMOeBkXrjGCWkzywRBpqhLnRJkscEWbZUqwGL7MkUUlNB/Cz6TJCtGL
 4ZwbXiKaAhZOMbrr3xoo2UPDUVfQZxSNtJN/Zg8la2nnYw/SjWQpRFehAc/g+owRbIiQemlCwlRTW
 FUftrTTwZPlLFZHRRYC+dS1wBy7VmZOdtOJojQB+vi/fw3+IVJYvfE7XwL3amum/RzF4lZuJxSuJk
 dp/f/e/A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vNX0y-00000003u95-2jhQ; Mon, 24 Nov 2025 13:54:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 84766300230; Mon, 24 Nov 2025 15:49:23 +0100 (CET)
Date: Mon, 24 Nov 2025 15:49:23 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 ojeda@kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 nouveau@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20251124144923.GK4068168@noisy.programming.kicks-ass.net>
References: <20251124231644.38d0303b@canb.auug.org.au>
 <20251124123249.GP4067720@noisy.programming.kicks-ass.net>
 <aSRlFB9PoOcZVmvt@tardis.local>
 <20251124144714.GT3245006@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124144714.GT3245006@noisy.programming.kicks-ass.net>
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

On Mon, Nov 24, 2025 at 03:47:14PM +0100, Peter Zijlstra wrote:
> On Mon, Nov 24, 2025 at 06:00:52AM -0800, Boqun Feng wrote:
> > On Mon, Nov 24, 2025 at 01:32:49PM +0100, Peter Zijlstra wrote:
> > > On Mon, Nov 24, 2025 at 11:16:44PM +1100, Stephen Rothwell wrote:
> > > > Hi all,
> > > > 
> > > > After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> > > > failed like this:
> > > > 
> > > > ERROR: modpost: "NULL" [drivers/gpu/nova-core/nova_core.ko] undefined!
> > > > 
> > > 
> > > Rust :/
> > > 
> > > So I have:
> > > 
> > > $ make O=tmp-build LLVM=-22 allmodconfig
> > > $ make O=tmp-build LLVM=-22 rustavailable
> > > Rust is available!
> > > $ grep -e CONFIG_RUST= -e CONFIG_NOVA= tmp-build/.config
> > > $
> > > 
> > > Help ?!?
> > > 
> > 
> > [CC nova]
> > 
> > On my system it seems that RANDSTRUCT=y prevents the enabling of RUST,
> > but I'm sure Danilo and Alexandre have better ideas about how to enable
> > nova-core.
> 
> Ah, indeed, RANDSTRUCT seems to be messing things up. I tried disabling
> that, but then I need to manually enable random crap to get Nova happy
> and menuconfig isn't very nice.
> 
> I really don't think rustavailable is doing a good job here. Strictly
> speaking yes, its available, but figuring out why things don't work is a
> giant pain in the arse.
> 
> Now, lets see if frobbing Kconfig to disqualify RANDSTRUCT will let
> allmodconfig work better.

This... ok now lets see wtf the actual problem is.

diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
index 86f8768c63d4..4a5890796ac2 100644
--- a/security/Kconfig.hardening
+++ b/security/Kconfig.hardening
@@ -282,6 +282,7 @@ config CC_HAS_RANDSTRUCT
 	# Randstruct was first added in Clang 15, but it isn't safe to use until
 	# Clang 16 due to https://github.com/llvm/llvm-project/issues/60349
 	depends on !CC_IS_CLANG || CLANG_VERSION >= 160000
+	depends on BROKEN
 
 choice
 	prompt "Randomize layout of sensitive kernel structures"
