Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6DE1B835B
	for <lists+nouveau@lfdr.de>; Sat, 25 Apr 2020 04:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF6A6EB9C;
	Sat, 25 Apr 2020 02:52:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9CB6E9E6
 for <nouveau@lists.freedesktop.org>; Wed, 15 Apr 2020 13:59:09 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id x25so17587764wmc.0
 for <nouveau@lists.freedesktop.org>; Wed, 15 Apr 2020 06:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=oNzqr4W0kmnZFd2IVVOD4F7CEhwCqXToSvFcmKkrVR0=;
 b=NmifIXPzQQRWBjxGAW5BAhLCBHn9JlTW+ieIof45VkKm0Uub0UsPAjTLbfz8dPtPKF
 UcKDyE9KTO8YsR8TGRuvuRUvEXasdkAMv9WC9oXt/zBFJOIXwmcu5yB1sj3pkTQD+BPB
 wA1P7dCNNwBS1DgOGBajGerdrOnu2za0DABBdxFg0WkxkKwPFUtFW0t6whdfbX6vztMG
 /w1v9TpyXe49zu3GDyb6FysLgVeCY3LkFXE31RWaWwg+Q0oIT2QoTg1Vm7NbOJXaFETM
 qmdNyXuKW/CZoPX4gRvmcWl4nbVsCoj4V1u6gGE/jrjaHI5NYTNFt/nBqw3i5m8QYs04
 W8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=oNzqr4W0kmnZFd2IVVOD4F7CEhwCqXToSvFcmKkrVR0=;
 b=exoWjGbXDvCJ6IV5uYFZy3KIeBEThLETd8R38Qwo/NVBSmiKxGJiNHBdb2An22CsCx
 kUMiALvaUL+myiPIYKCeuqOgM4CKSrE3O62K9+Jnjy3un6qaxLaT9EYF+6+xM1+fOQEL
 dy2+y3gyMFenmRRw4eSOiBWt9BjgEfkJq4i/o7+gjillIKtbNYW32bWr0ztVeNYIVpEA
 sEV2oq4wI44O/A8zo052tm+VE7rPw/wvQmKfAbu7VWkIvSCrX0TBUVBIv0TLML3CxiIa
 YsHNyab0ooiPbISk+wYW9WmUFaXgFEV7YrxrWYi09Jc0BIAy+skhrLs+22CzMFXkmKGw
 pi1w==
X-Gm-Message-State: AGi0PuatI4PmXYcrjZKbQsGCF9cNL3H9Tjf8IVy+GEkvXhZ7wiVm+WfN
 mUTLyf8nh55gXUsi2SFlfrAkmGWHWw/X81yGf+8=
X-Google-Smtp-Source: APiQypKIKAI4R7MZYat+lp68qYQ24g8WhU9ryf5v0iyzZHRHBMG3LozUhEXKcrW6Q5mF/yvpXM5RIDXu2de0ws5Mpx8=
X-Received: by 2002:a7b:c927:: with SMTP id h7mr5303390wml.122.1586959147836; 
 Wed, 15 Apr 2020 06:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200408205323.44490-1-natechancellor@gmail.com>
 <CA+icZUUTEEZww3qT0jfFP0ZgUPXoF1_uOHMT4ZecrQxumE1Zmg@mail.gmail.com>
 <CA+icZUWq=_qjvAf40PqQAj3tQ0WAZ2QAR9hojTuYqZH_=RWd_w@mail.gmail.com>
In-Reply-To: <CA+icZUWq=_qjvAf40PqQAj3tQ0WAZ2QAR9hojTuYqZH_=RWd_w@mail.gmail.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 15 Apr 2020 15:58:56 +0200
Message-ID: <CA+icZUV336Y5YJ3OUYzXGfMZGbPSCt9YBVBRhiOnRCNQzc2z-A@mail.gmail.com>
To: Nathan Chancellor <natechancellor@gmail.com>
X-Mailman-Approved-At: Sat, 25 Apr 2020 02:51:59 +0000
Subject: Re: [Nouveau] [PATCH] x86: mmiotrace: Use cpumask_available for
 cpumask_var_t variables
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
Reply-To: sedat.dilek@gmail.com
Cc: nouveau@lists.freedesktop.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Apr 8, 2020 at 11:36 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:

[ ... ]

> Feel free to add appropriate credits:
>
>    Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
>

Re-tested with Linux v5.7-rc1 which shows this warning - with GCC v9.3
and LLVM/Clang v10.0.0 (and snapshot/pre-release of v10.0.1) on
Debian/testing AMD64.

- Sedat -
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
