Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B14652F6D61
	for <lists+nouveau@lfdr.de>; Thu, 14 Jan 2021 22:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAFE896B0;
	Thu, 14 Jan 2021 21:43:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF8F896B0
 for <nouveau@lists.freedesktop.org>; Thu, 14 Jan 2021 21:43:36 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1AA0923A5B;
 Thu, 14 Jan 2021 21:43:34 +0000 (UTC)
Date: Thu, 14 Jan 2021 16:43:32 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: trix@redhat.com
Message-ID: <20210114164332.5e7ed5f5@gandalf.local.home>
In-Reply-To: <20210114212827.47584-1-trix@redhat.com>
References: <20210114212827.47584-1-trix@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Nouveau] [PATCH v2] x86 : remove definition of DEBUG
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
Cc: x86@kernel.org, alexandre.chartre@oracle.com, paulmck@kernel.org,
 peterz@infradead.org, nouveau@lists.freedesktop.org,
 dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org,
 mchehab+huawei@kernel.org, ppaalanen@gmail.com, mingo@redhat.com, bp@alien8.de,
 luto@kernel.org, hpa@zytor.com, tglx@linutronix.de, ying-tsun.huang@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, 14 Jan 2021 13:28:27 -0800
trix@redhat.com wrote:

> diff --git a/arch/x86/mm/mmio-mod.c b/arch/x86/mm/mmio-mod.c
> index bd7aff5c51f7..cd768dafca9e 100644
> --- a/arch/x86/mm/mmio-mod.c
> +++ b/arch/x86/mm/mmio-mod.c
> @@ -10,8 +10,6 @@
>  
>  #define pr_fmt(fmt) "mmiotrace: " fmt
>  
> -#define DEBUG 1

Seems to only be used for printing the pr_debug() functions.

> -
>  #include <linux/moduleparam.h>
>  #include <linux/debugfs.h>
>  #include <linux/slab.h>

Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
