Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FFA1B8359
	for <lists+nouveau@lfdr.de>; Sat, 25 Apr 2020 04:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2BB6EB9B;
	Sat, 25 Apr 2020 02:52:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E616EB00
 for <nouveau@lists.freedesktop.org>; Wed,  8 Apr 2020 21:12:56 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y24so1408033wma.4
 for <nouveau@lists.freedesktop.org>; Wed, 08 Apr 2020 14:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=+AwwgEHFD5bilNHg0VD/JP6P2YBOrf+uHd0tB2xL4pE=;
 b=HkZV9t2hAwjvaNhBlInKGUCm/hr7/K/Ey+6xiClnyWaqye+9xiel5MCdKkVIKQ+4kI
 wI9jPSDGtZSRGvJTfzk2yFoyO4eObyDs0r/Jyse9iJx/i2u6HjeJriDGvfNYZCj/FJ6Q
 IDgu+b70BhF07VBMWANUNUnWhyt4h3GSVMFJsJWZmoRbY/8eFXBz6rAtRHJd22KdmAAl
 zqNClInIVowsg7lsCCRIuCEK/XJX1csE/bTALDy1j3WnoFWpcJApeb7ef6q74Nwqu4xc
 jEn8bm+Kt6pjX1kcSfnv7wyV1ujlLtgPPVMiueehgLrfhGFxsoiRjoI+HVW7WUM7Ernd
 5GWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=+AwwgEHFD5bilNHg0VD/JP6P2YBOrf+uHd0tB2xL4pE=;
 b=hacqixnNKUfCOL6Yt3aDF2x0wqW/RvVnM1hTMvxRHEyhycz6QT8OQ70jOBZeKqb1Uu
 WcFEBA3SlIprE72eAqoPxDNjndV2CREJBq8AEkBa4FzV4mJjCg+QUKC7DUncEuyXR27y
 0piFfY7NSojxDKkItoH9UWRUJijuIRD2xJQB+R/2dqZYoeQB0/kuUP3jZ2hK3kCdyFFB
 oXNnLf05gawROssKz6ZTPZ0RurJis4idQWrVMEbEIVbH6lKaHXrlhUGQF2zqL9fhomfX
 hzPpf87t3Loo6fcT26dCYAqa7XpVjLrH7vxHbeCDI0r93CxlSaBSp+NfRN8dg2pfc8aA
 7PeA==
X-Gm-Message-State: AGi0PuaZc/m2PS9ZCJgSybhSCBD80vRuWXYRb1Cq1g7cKVjD8wTn+y3A
 i3OjXcOytsxIYW0oOe6vN7MV5z1hzI5bMFI79TU=
X-Google-Smtp-Source: APiQypIEA+vymPWIIq5+2XuP34UflBloAgSXy7ew6JLfr6plXXbaqmNJRlxdTY3HEMwJyuv/xPkyzLlHszjkF8+Cgz0=
X-Received: by 2002:a7b:c927:: with SMTP id h7mr6424887wml.122.1586380375005; 
 Wed, 08 Apr 2020 14:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200408205323.44490-1-natechancellor@gmail.com>
In-Reply-To: <20200408205323.44490-1-natechancellor@gmail.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 8 Apr 2020 23:12:43 +0200
Message-ID: <CA+icZUUTEEZww3qT0jfFP0ZgUPXoF1_uOHMT4ZecrQxumE1Zmg@mail.gmail.com>
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

On Wed, Apr 8, 2020 at 10:53 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> When building with Clang + -Wtautological-compare and
> CONFIG_CPUMASK_OFFSTACK unset:
>

Hi Nathan,

thanks for the quick patch.

I can confirm I have no CONFIG_CPUMASK_OFFSTACK set.

Regards,
- Sedat -


> arch/x86/mm/mmio-mod.c:375:6: warning: comparison of array 'downed_cpus'
> equal to a null pointer is always false [-Wtautological-pointer-compare]
>         if (downed_cpus == NULL &&
>             ^~~~~~~~~~~    ~~~~
> arch/x86/mm/mmio-mod.c:405:6: warning: comparison of array 'downed_cpus'
> equal to a null pointer is always false [-Wtautological-pointer-compare]
>         if (downed_cpus == NULL || cpumask_weight(downed_cpus) == 0)
>             ^~~~~~~~~~~    ~~~~
> 2 warnings generated.
>
> Commit f7e30f01a9e2 ("cpumask: Add helper cpumask_available()") added
> cpumask_available to fix warnings of this nature. Use that here so that
> clang does not warn regardless of CONFIG_CPUMASK_OFFSTACK's value.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/982
> Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  arch/x86/mm/mmio-mod.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/mm/mmio-mod.c b/arch/x86/mm/mmio-mod.c
> index 109325d77b3e..43fd19b3f118 100644
> --- a/arch/x86/mm/mmio-mod.c
> +++ b/arch/x86/mm/mmio-mod.c
> @@ -372,7 +372,7 @@ static void enter_uniprocessor(void)
>         int cpu;
>         int err;
>
> -       if (downed_cpus == NULL &&
> +       if (!cpumask_available(downed_cpus) &&
>             !alloc_cpumask_var(&downed_cpus, GFP_KERNEL)) {
>                 pr_notice("Failed to allocate mask\n");
>                 goto out;
> @@ -402,7 +402,7 @@ static void leave_uniprocessor(void)
>         int cpu;
>         int err;
>
> -       if (downed_cpus == NULL || cpumask_weight(downed_cpus) == 0)
> +       if (!cpumask_available(downed_cpus) || cpumask_weight(downed_cpus) == 0)
>                 return;
>         pr_notice("Re-enabling CPUs...\n");
>         for_each_cpu(cpu, downed_cpus) {
>
> base-commit: ae46d2aa6a7fbe8ca0946f24b061b6ccdc6c3f25
> --
> 2.26.0
>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
