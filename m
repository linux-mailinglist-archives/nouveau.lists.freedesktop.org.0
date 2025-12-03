Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 501C1CA1EEC
	for <lists+nouveau@lfdr.de>; Thu, 04 Dec 2025 00:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532C810E19E;
	Wed,  3 Dec 2025 23:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="yPNsnrKP";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B039D10E19E
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 23:25:26 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-645ed666eceso1750a12.1
 for <nouveau@lists.freedesktop.org>; Wed, 03 Dec 2025 15:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764804325; x=1765409125;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a6uoVhNguoRPRGf5uoEhquoFovSI0B7deZMJWzTJLAU=;
 b=yPNsnrKPFeDTfniYYEXK5LswZLTt9RpN2gAGVwLxWhJIlfomkKab0Nv2fM5TY0rGQ2
 ONGssrIqIah6/BWs4I1mJ9L5WCT/jBvAvnNBREDIjYbJQ6won/WtuKA/TTKOXehBZKb5
 JKwFmE0goSa0maREH+Dx9QCg2MtwYMR6/laromMEVFkWSUqA55QcaEjgQe5Vh9b7SvaC
 2ERn04dGOA3rKwmCUE8X4CdzTOYIhIA7JkVr+ZmxHxMvzMlBEbNcwmZO0tEXyVamStPL
 9/4qbfYEb5+eACADjK4Sv+3tB/+dyyr/dm7Dyzfy4oL7ePOUNkoh/2kr+k4mdM11xuHO
 0DIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764804325; x=1765409125;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a6uoVhNguoRPRGf5uoEhquoFovSI0B7deZMJWzTJLAU=;
 b=QOtMDbbgzHYqD2j15YzqkjNu2gi2wxPjELVLwgwMzfKmt47S0uDKR239Gc+ak3K3JR
 fvtwYuyzauSZLo7TdVSeDJXAj3aRdnbDB1y6q2SLVbeKIj7WfcgcWX5s5K2NB2AQ+nIo
 CtOg8J4hGY3T1L19vNiqN39ZkHD9xkUHrn1o6e2xi1KoDNEvHLVpDb1V6FghMOx0FR1q
 HGOEwFqfWT9r2ykdPmlVT9mWwe5kZWbNiAVhaHCGYRZvBajaKNV8UFkvotC2oHI6lHto
 wK5jz65oMTrbbjWs53dB/Lz4DK8+WKXaajHvbo/1Y2C8oJLXaiJvt9MAEKl+lQTHEJwN
 Xbqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8vVQx7/OMmSRyaYNzS5Q4y8oZ1wQK1JDLlJOMKn8Oe+KLg1NmaVXCXGbV3DZ/fmOFkPG42Jwt@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzS8y/tMqyed4sNsHG7ETnK+AHB5EiN+DbtVcJ1QM1PMQlYTXD
 KzBcVUYzSstVd0V0wnz0R+x/th2PQXLKTSSo92AW+i6qPAheRg1nt7ft5/cx0u356pVt6fSo8yV
 idZKvAuKZ7TqnA6IZsa9YOgRz+37jqra9dL4g+vxZ
X-Gm-Gg: ASbGncsaTUIKWvk+eU4MRmpAU9tpOBz0ddp6FgZDRXm74ocPQrAO/mzu4jC7UiT7BPJ
 X5C7urBU1tCRTmmX9xpmAEuAI3GOieLcjqBeQwR2808ANWMS/r4GhKxEOr4Nrb8q7aKLhQ61If5
 tH2TGUJ+EWfimFbH5hrfmFQBTiAKQGXi1AVrY00OwAnMhWhkGVdu7m89ls5WDjuoAgQraoAEMTu
 +Gb0NG+9ufwyR/P1S6XkvkOD0lwY5WTcvdqFlIkIEkVUMBM7i8TZqpduMVf7agntOFg+IaagWIc
 9dIblb5Io8Pgp6u2TTkbUlSR
X-Google-Smtp-Source: AGHT+IEXEQTgoa3Tuakna4skmZg2pw/mrECwMwVvdW0fQYVmXvi58ZGexwzvZpC2XAuu5b911WZjF7TrDbbogWoEqU4=
X-Received: by 2002:aa7:cf02:0:b0:640:8f9c:af3a with SMTP id
 4fb4d7f45d1cf-647a7728a14mr14606a12.6.1764804325007; Wed, 03 Dec 2025
 15:25:25 -0800 (PST)
MIME-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
 <20251203212558.GB3060476@ax162>
In-Reply-To: <20251203212558.GB3060476@ax162>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 3 Dec 2025 15:25:13 -0800
X-Gm-Features: AWmQ_bmE-9G2UW0Equri3aRgg0NngGho89_DAwKEs6T1gQOz1p2ws5lgLkHiDf4
Message-ID: <CAGSQo00bG7QF+u2WJQwMTiq6iGATcSfaAurkkppykkn+yTL-TQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
 nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

> I am just curious, why would someone want (or not) to do this? This help
> text does not really indicate the point of the option, just what it
> does. Is it just the standard tradeoffs with inlining (potential
> improvements in performance due to better optimization opportunities
> versus text size increase and icache pressure) or something else?

The main situations where someone would want this off are:
* Not using `clang` (should already be covered in config logic)
* Out of tree module build without the whole kernel build tree (the
`.bc` file produced here would need to be shipped to your out-of-tree
module build environment - it essentially becomes like a header file
for purposes of building an out-of-tree / DKMS Rust module)
* Don't have matching `rustc` and `clang` LLVM (kind of covered in
config logic - if anyone is using a non-release version of LLVM, the
config may indicate them as compatible incorrectly).
* Requires out-of-tree / DKMS Rust modules to build with the same LLVM
revision as the kernel was built with - may be a packaging concern

While the usual inlining tradeoffs apply, all of these functions have
been explicitly marked `static inline`, which indicates those
tradeoffs have already been thought through.

I think that if we had a reliable signal of "`clang` and `rustc` use
compatible bitcode", turning this on by default would be reasonable.
As-is, we have a mostly-reliable signal, so defaulting it to off seems
reasonable so that people don't get surprise miscompilations if they
use a `clang` or `rustc` which are not using precisely a
release-boundary LLVM version. People who know their toolchain story
for x-lang is squared away can turn it on.

>
> Cheers,
> Nathan
