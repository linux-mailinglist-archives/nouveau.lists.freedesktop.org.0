Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A47C8243F
	for <lists+nouveau@lfdr.de>; Mon, 24 Nov 2025 20:19:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233E810E255;
	Mon, 24 Nov 2025 19:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="a6mvdVM9";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E4010E255
 for <nouveau@lists.freedesktop.org>; Mon, 24 Nov 2025 19:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CNa9srSIcY5r3Il/+ILNAkNK75nUaMyNXbkFg6SLZHU=; b=a6mvdVM94zjrf6m8bEJPcIVfMs
 Q82C/zpTrLz7lQF9TN3qSMOCalQ2o6Dx16C7G+X9VR48fhrRICWD1HxKQYqdTGeT59WE0ZIXxbO5k
 HWrOpoU4JSU9REtUFC5R/YFCKzXDwN7SQ1zoxKi0h+2qJpxtDp9gsdEIKeNc6yegEXtxX2N7gll1L
 Rovt/QXgsPG5npKsNh3qyEj+YqR5LncE73qDK9xSknNZ4kSxYMrJGHsjrGq2zKZwkCR+y0rwgIFrc
 SlkfEAhounLJ1xC/MCTbyLuB0goh6/9uMyhrxDB+KDP0ub6X+RrXC3918tKgOGt5ZDQdaWCOHvsEo
 BqFFSR/A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vNc5Y-00000007Pk8-1vHo; Mon, 24 Nov 2025 19:19:04 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 5E2A53002A6; Mon, 24 Nov 2025 20:19:03 +0100 (CET)
Date: Mon, 24 Nov 2025 20:19:03 +0100
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
Message-ID: <20251124191903.GM4068168@noisy.programming.kicks-ass.net>
References: <20251124231644.38d0303b@canb.auug.org.au>
 <20251124123249.GP4067720@noisy.programming.kicks-ass.net>
 <aSRlFB9PoOcZVmvt@tardis.local>
 <20251124144714.GT3245006@noisy.programming.kicks-ass.net>
 <20251124144923.GK4068168@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124144923.GK4068168@noisy.programming.kicks-ass.net>
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

On Mon, Nov 24, 2025 at 03:49:23PM +0100, Peter Zijlstra wrote:

> This... ok now lets see wtf the actual problem is.

This cures it. I'll go rebase that tree.

diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index a3dd6805b574..d0a96ff5c02c 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -104,7 +104,7 @@ do {									\
 
 #define ARCH_WARN_ASM(file, line, flags, size)				\
 	"1:\t " ASM_UD2 "\n"						\
-	_BUG_FLAGS_ASM("NULL", file, line, flags, size, "")
+	_BUG_FLAGS_ASM("0", file, line, flags, size, "")
 
 #else
 
