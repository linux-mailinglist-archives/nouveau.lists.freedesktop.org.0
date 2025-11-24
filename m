Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F69C8195A
	for <lists+nouveau@lfdr.de>; Mon, 24 Nov 2025 17:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5AB10E2E5;
	Mon, 24 Nov 2025 16:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="mEZk2m9X";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C25A10E2E5
 for <nouveau@lists.freedesktop.org>; Mon, 24 Nov 2025 16:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=tL+39OnwTLvrAWvrGLglm04jsHHrgdlmkveq7RkWEdU=; b=mEZk2m9X1XDOzI4SKbvJ/c5atn
 QXMRhnKkDWLYeIuQ13Z6fXRwrBM+V5Dnf0JuEfVGpf0SdRcob61LNH15NWSNEd4Zsb5gruwpGQRIa
 7vOWKUBElof77Gm7UsUv98B1W4SIRGtBJOhdX0iOTf5aVnasmKH5HcWtnF5l0dYcw0zMek0PwIvc+
 647knoV4nzZ9Ha52DL4zCYHCQxIjKRLuZFUdl0BioQmunBMv32pcnJHi8AU3joDadkZNwZtZftTov
 oxZdH3phQ06JvuNAuvb3Sq+twFImsNLh42OWeL3alFfKhp/CFMWSIIjATImcy/+IkWBwDHVK1yB+t
 NHbOaBKg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vNZV6-00000007EXl-3fUN; Mon, 24 Nov 2025 16:33:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id A75393002A6; Mon, 24 Nov 2025 17:33:15 +0100 (CET)
Date: Mon, 24 Nov 2025 17:33:15 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 ojeda@kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 nouveau@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20251124163315.GL4068168@noisy.programming.kicks-ass.net>
References: <20251124231644.38d0303b@canb.auug.org.au>
 <20251124123249.GP4067720@noisy.programming.kicks-ass.net>
 <aSRlFB9PoOcZVmvt@tardis.local>
 <20251124144714.GT3245006@noisy.programming.kicks-ass.net>
 <CANiq72kN_QjYSCdzs9UCx2sHdR9Q2g_7_h-ZZ2y0qLZjhUxX6g@mail.gmail.com>
 <20251124145544.GU3245006@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251124145544.GU3245006@noisy.programming.kicks-ass.net>
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

On Mon, Nov 24, 2025 at 03:55:44PM +0100, Peter Zijlstra wrote:
> On Mon, Nov 24, 2025 at 03:51:46PM +0100, Miguel Ojeda wrote:
> > On Mon, Nov 24, 2025 at 3:47 PM Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > By the way, I have had this patch around for RANDSTRUCT a long time:
> > 
> >     https://lore.kernel.org/rust-for-linux/20241119185747.862544-1-ojeda@kernel.org/
> > 
> > More than glad if someone confirms it works for them...
> 
> /me mumbles something about using clang to inject C IR into the Rust
> thing and kicking bindgen to the curb :-)

FWIW it might be relatively simple to abuse precompiled headers for
this. Generate the pch files using clang and the normal linux build
flags, then let rust do something like:

  unsafe extern "C" include "header.h.pch"

or whatever fits the syntax best -- some day I'll get around to learning
this thing.

That way you can fairly trivially inject AST/IR from another language --
including all the inline functions and inline asm bits.
