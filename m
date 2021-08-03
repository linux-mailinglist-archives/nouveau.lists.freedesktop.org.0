Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B56B13DF106
	for <lists+nouveau@lfdr.de>; Tue,  3 Aug 2021 17:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EA489C46;
	Tue,  3 Aug 2021 15:03:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7ACC89C46
 for <nouveau@lists.freedesktop.org>; Tue,  3 Aug 2021 15:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628003025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7tbb0CsnnLf2HSZfxDfKO/Er3Zkctrt268hAInT4vLU=;
 b=bEFDZCksmFSIkYhYuRYLmvcOhOMqwQrF28dw8vn1XwdGWCjS5oOzaJynh97G+IlQDJCgJK
 W8cGz/ovgSwwBQ1d5ZsSknVblYcDrs3jaNCyGY0mSWx0auoq9kI1eTtjWstUNUb8kdViW+
 Asqx7ITPhYEzZACIXadctsa25WzX9IA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-wY6mEXj1P4CQq6COMTBdMw-1; Tue, 03 Aug 2021 11:03:44 -0400
X-MC-Unique: wY6mEXj1P4CQq6COMTBdMw-1
Received: by mail-wm1-f72.google.com with SMTP id
 g187-20020a1c20c40000b02902458d430db6so3990635wmg.9
 for <nouveau@lists.freedesktop.org>; Tue, 03 Aug 2021 08:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7tbb0CsnnLf2HSZfxDfKO/Er3Zkctrt268hAInT4vLU=;
 b=RIrIdriy61w0XWAUD3oKAdfXcGOCwzEL2pZaIdXUccITvumWm/FWQnri9Yc4X2vF6G
 yxJTXdQA1AJ0Yp1FMXfJnoH60TO02mxJEbmhjUprnr++EQceWuDyt8X/74HHGhyyLBug
 FyoaksaHbtJjbOOpRCGBi8a5E4nyk3OEEa2sN8CynBYTT3CwQjVDI+IZ+nQNt8ABxOsU
 oBwgEYo3jVfwyklVK04gjle0LtiKOkKQltEmfIYZfGZFUbAXdIYeRXg2C0NOcbeD65mT
 oI3NoTolwNA4/TWK7i1lT/LUGf3t6PSD8tRtBUBYgPrFm35hqCZ7l5KwCjvN4v/ptBr0
 +Z3A==
X-Gm-Message-State: AOAM532qjlxssflfpPrakW5KzVU35g8qPI50Je+UdC5AXFMlCd8SCBvl
 b/GTrwLE3Bo3BsEAbc0gpOgw+uskfWgBAwkOhNRoxXBDugwsQ4bBhLJovb+fFVHOTxq+VHEdE+j
 9twI/MObrbzaqkacb7GuHSLKySLhH2P0RzlVNUoKjqg==
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr4843729wmf.163.1628003023104; 
 Tue, 03 Aug 2021 08:03:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykRywpEC7AOtnyF33drX5yQPQK6cTLMRKJswnyy1gmxHAG7bcbQHRlUM/7z8pByC9MVYVggHDv1kinAc16ErE=
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr4843706wmf.163.1628003022887; 
 Tue, 03 Aug 2021 08:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210803141621.780504-1-bigeasy@linutronix.de>
 <20210803141621.780504-7-bigeasy@linutronix.de>
In-Reply-To: <20210803141621.780504-7-bigeasy@linutronix.de>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 3 Aug 2021 17:03:32 +0200
Message-ID: <CACO55tvuMM2HcYOUguZzJPi5TvYgeY=N=+psM9T1G7CMA8d=Dg@mail.gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@kernel.org>, Karol Herbst <karolherbst@gmail.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, nouveau <nouveau@lists.freedesktop.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH 06/38] x86/mmiotrace: Replace deprecated
 CPU-hotplug functions.
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

On Tue, Aug 3, 2021 at 4:25 PM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> The functions get_online_cpus() and put_online_cpus() have been
> deprecated during the CPU hotplug rework. They map directly to
> cpus_read_lock() and cpus_read_unlock().
>
> Replace deprecated CPU-hotplug functions with the official version.
> The behavior remains unchanged.
>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Karol Herbst <karolherbst@gmail.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: x86@kernel.org
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  arch/x86/mm/mmio-mod.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/mm/mmio-mod.c b/arch/x86/mm/mmio-mod.c
> index cd768dafca9e9..933a2ebad471b 100644
> --- a/arch/x86/mm/mmio-mod.c
> +++ b/arch/x86/mm/mmio-mod.c
> @@ -376,12 +376,12 @@ static void enter_uniprocessor(void)
>                 goto out;
>         }
>
> -       get_online_cpus();
> +       cpus_read_lock();
>         cpumask_copy(downed_cpus, cpu_online_mask);
>         cpumask_clear_cpu(cpumask_first(cpu_online_mask), downed_cpus);
>         if (num_online_cpus() > 1)
>                 pr_notice("Disabling non-boot CPUs...\n");
> -       put_online_cpus();
> +       cpus_read_unlock();
>
>         for_each_cpu(cpu, downed_cpus) {
>                 err = remove_cpu(cpu);
> --
> 2.32.0
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

