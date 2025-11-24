Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A033ACBABE6
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E7710EB27;
	Sat, 13 Dec 2025 12:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="WygyOlUg";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C6610E2D1
 for <nouveau@lists.freedesktop.org>; Mon, 24 Nov 2025 14:51:59 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b8b33cdf470so121865a12.0
 for <nouveau@lists.freedesktop.org>; Mon, 24 Nov 2025 06:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763995919; x=1764600719; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/cuXBv9WUJm6Kko0g9y8Xk9WBvYZvMR/dgMEJPiZVyU=;
 b=WygyOlUgkHEjn38i3yGw/GncJJIIwoAtsIrcqRO1aXas5x85zyNeWQ0StQjm7dYg1G
 T4hliRinEblUN9tfCHaRKQu3l1kD+QyvJR/KPXCGF1bwRo6My990UWhe6GOdkPa/e68r
 grXjv75r04bnYZ4j7+VCjwULzSHm2AJhZM/cg5VyXvtz5SgT1lbFArqY8zOs5lT7vv1p
 m/3IRcZDitP4WBwaWUWNgSgD8AifH+CEeAv2WGie7kyYhtaluR7P3oojro7mtiJHCB7b
 7FV4ri3SVr2QuZDFGSVI/4yxAnjQ/uKPx/BmkuZ1xfMgGhX7Da4+K4KRPdyQyjzW7BIn
 XTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763995919; x=1764600719;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/cuXBv9WUJm6Kko0g9y8Xk9WBvYZvMR/dgMEJPiZVyU=;
 b=FpJgJW+t8CRee6r2d5rVqHFHWaBbnxLH1nhzI0cmfl0v56fR77LtQwN7RGE68qxoP/
 ryA873ziR7x4oIH2ynrK3Sno8d+QMpT8bNjE6rgrUryHdHZvXuXoXWJck/GCdM/qU7tD
 0LLp6NGN1II0ecU6HjKxsMV8nuOVNPHyI5ipdkQhc22lpNUmmRtB1tBi4RM7uagEBeWX
 tN8r76FpwyU1azNP7k+A1lCCncdRunia5Lfus0+shWk08+gMiHXCSp5svwJY6EImPt4c
 W/xWLeXpPebi/ryvo2WJyta9bCoCpi1khiQMMvL0uxtKFxxqbRAHCIAxAlT9/lWusNJ1
 E6jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGRAq1COoqrRbQOb+GgwlROzFYv0lyA44944+G9H7MPoTwQlnn34GI49qztbgWRbcoIS9XsJXy@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxW8T2PfHn+PFL3D8MGCKAStGXYCa4gUDUsAhyhdoH4Rp5WumI3
 7DuNa7bG5YW8k6sdXQk2yDLKS9Pk2EPFi+cPTz2Tg63oIcxrds0hRRHmS30s2cJN4RBvtrMuXeQ
 vioOr+iMt6k/i8XaIs5hV/yqqBvgD49Q=
X-Gm-Gg: ASbGncuOis53kb+lxPsdUDvKTkzuX8uvnpCZaZz2CEzVehTdnZsxYc+5LAqcvNIy+KC
 IGfoKfiRNVR+46exKgMLZcH+a9bfIU/ZgKfXTfrVvff+CHbcHqsPQnExPtoGBrkQcu9b47W9NHZ
 K4Xj/U+J1JcQkoYw+eGV1zfJ7MzheRTMe82xzkSGAvwEuHYxGJVaVCNc8+OwKkF4Bdaz1X/YZsx
 dVooFl64ZA6VhyBxRODJpH5vZBgqhtKSaEyGe7geuasWJoiuU0h/bGwlSPIPC409ZeckdxtbTdC
 EFlaAt4QwLpV8HxfbFMHDVdDdNScFsyx21iP/SBTzt95zsdfZD0qcRBWaIAdjCGOZODdxU5dFK2
 s7F2QzRU9+mxQ/w==
X-Google-Smtp-Source: AGHT+IHPUoZtQP0D4LXyIGxGGt4feAJlxaU/xnzf58w7DLQtCNJmBFAVlgka05hrCrIG2fNw6s735Cx7RdDtbzh+p78=
X-Received: by 2002:a05:7300:ac82:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2a724c02369mr6966770eec.3.1763995918927; Mon, 24 Nov 2025
 06:51:58 -0800 (PST)
MIME-Version: 1.0
References: <20251124231644.38d0303b@canb.auug.org.au>
 <20251124123249.GP4067720@noisy.programming.kicks-ass.net>
 <aSRlFB9PoOcZVmvt@tardis.local>
 <20251124144714.GT3245006@noisy.programming.kicks-ass.net>
In-Reply-To: <20251124144714.GT3245006@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 15:51:46 +0100
X-Gm-Features: AWmQ_bkcTjev6aW2ygRL9xeP9TP5FKOyn61229OF8XBDxgWHkq8wbcdDoBOjJiU
Message-ID: <CANiq72kN_QjYSCdzs9UCx2sHdR9Q2g_7_h-ZZ2y0qLZjhUxX6g@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the tip tree
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>, ojeda@kernel.org, 
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 nouveau@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:48 +0000
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

On Mon, Nov 24, 2025 at 3:47=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> I really don't think rustavailable is doing a good job here. Strictly
> speaking yes, its available, but figuring out why things don't work is a
> giant pain in the arse.

I guess `rusttoolchainavailable` would have been a better name, i.e.
it is only about the toolchain, not about the kernel config
requirements:

  rustavailable   - Checks whether the Rust toolchain is
                    available and, if not, explains why.

> Now, lets see if frobbing Kconfig to disqualify RANDSTRUCT will let
> allmodconfig work better.

By the way, I have had this patch around for RANDSTRUCT a long time:

    https://lore.kernel.org/rust-for-linux/20241119185747.862544-1-ojeda@ke=
rnel.org/

More than glad if someone confirms it works for them...

Cheers,
Miguel
