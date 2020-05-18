Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C08F1D879A
	for <lists+nouveau@lfdr.de>; Mon, 18 May 2020 20:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A265289BEC;
	Mon, 18 May 2020 18:53:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1D489BEC
 for <nouveau@lists.freedesktop.org>; Mon, 18 May 2020 18:52:59 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id l73so272571pjb.1
 for <nouveau@lists.freedesktop.org>; Mon, 18 May 2020 11:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dFak8/mdn0uAmUBsx2tXCAV4WCKdaMa+D5ub/JVb32o=;
 b=a84EmTd7Tp4Pbn+CkrTqRzCc9g1R2avRZs0ToXDlNwKWovnLKeUoMqxYCcT8OdRnuh
 kOexfXAYAL+KHDoNg7U20KPSIBzA7Szr/zYqZk1ERuAOfOViF2O7TKSEJZZqdJwAqpMN
 pI1+wDVlgTDzs3nwvN48hyGtwiD0oVtj8Cg4xsl5LUKsSYlK0UH7lmURJ9Ao5E+OATu9
 oQ1HjwsSWFFBUt+Zj9fNShLRAvZ5wlViWzQB7myPFPyLnjeEwlkv4uf7wdZsiL36p4ml
 9qY4OUM1FPwT2O/LdnL4yLpeaTnE0+TzO8IB3pjzuc9XPDH3J+9XYVdd/oCQ87bBMjz9
 Tn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dFak8/mdn0uAmUBsx2tXCAV4WCKdaMa+D5ub/JVb32o=;
 b=MLOj58PNCbxR1rmzA4IhbSlTy21v2oyvxq7tmF2WWSfZrLSRrs94ag3B+a7AX7QTB1
 /P8Lgc7MgfJegZMercmBkfuUrbUUBdm5YYgGrfVAZFBGYIPnJ02L3Tdw+D3BLd7ltdiz
 We9F3ofYabej67tQ96eOd5vejQfZkhqs73Y3yCrnYrwQPJbJ4QUO21kmWvAoSEXHohux
 pMWQV2JD4THXhE+1oAfeo7ZU4bGyqnXQ5ig4rvaMYsRQk6RQu7lGkC8egKokeU9aTIDV
 mo7bSy4a98hvHXNw5nTNGIRSJhwBDGxc2Dd39dNq5CebGi/ZG++PqbnnrXcJEdNjW3V/
 o/oQ==
X-Gm-Message-State: AOAM532/qXrx+NBDlK0sAeCiGZ3vmx88pnuDt9FpVkFDbghGlYRUIq7R
 XSxe5UniDyhTjsdxYHF0QJFeYxnpFsfkPWZF264+NA==
X-Google-Smtp-Source: ABdhPJwD4+q9rE52VUN1KmW84Ac+bxZIw4F46mR/IkVNPqXIvZlTgE2/S2ihGw8kx4s+4gkQ/0I9rnCcyC4gaCDzGIc=
X-Received: by 2002:a17:902:82c9:: with SMTP id
 u9mr6715535plz.179.1589827978379; 
 Mon, 18 May 2020 11:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200408205323.44490-1-natechancellor@gmail.com>
 <20200518093117.GA719849@ubuntu-s3-xlarge-x86>
In-Reply-To: <20200518093117.GA719849@ubuntu-s3-xlarge-x86>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 18 May 2020 11:52:47 -0700
Message-ID: <CAKwvOdmXgYThHRDpt5dFZy5T1zS6MYQhcBNcq6-rsuc5fjiE6Q@mail.gmail.com>
To: Nathan Chancellor <natechancellor@gmail.com>
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
Cc: nouveau@lists.freedesktop.org,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Sedat Dilek <sedat.dilek@gmail.com>,
 Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, May 18, 2020 at 2:31 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Wed, Apr 08, 2020 at 01:53:23PM -0700, Nathan Chancellor wrote:
> > When building with Clang + -Wtautological-compare and
> > CONFIG_CPUMASK_OFFSTACK unset:
> >
> > arch/x86/mm/mmio-mod.c:375:6: warning: comparison of array 'downed_cpus'
> > equal to a null pointer is always false [-Wtautological-pointer-compare]
> >         if (downed_cpus == NULL &&
> >             ^~~~~~~~~~~    ~~~~
> > arch/x86/mm/mmio-mod.c:405:6: warning: comparison of array 'downed_cpus'
> > equal to a null pointer is always false [-Wtautological-pointer-compare]
> >         if (downed_cpus == NULL || cpumask_weight(downed_cpus) == 0)
> >             ^~~~~~~~~~~    ~~~~
> > 2 warnings generated.
> >
> > Commit f7e30f01a9e2 ("cpumask: Add helper cpumask_available()") added
> > cpumask_available to fix warnings of this nature. Use that here so that
> > clang does not warn regardless of CONFIG_CPUMASK_OFFSTACK's value.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/982
> > Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Thanks for the patch, sorry I'm falling behind on code review!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> > ---
> >  arch/x86/mm/mmio-mod.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/x86/mm/mmio-mod.c b/arch/x86/mm/mmio-mod.c
> > index 109325d77b3e..43fd19b3f118 100644
> > --- a/arch/x86/mm/mmio-mod.c
> > +++ b/arch/x86/mm/mmio-mod.c
> > @@ -372,7 +372,7 @@ static void enter_uniprocessor(void)
> >       int cpu;
> >       int err;
> >
> > -     if (downed_cpus == NULL &&
> > +     if (!cpumask_available(downed_cpus) &&
> >           !alloc_cpumask_var(&downed_cpus, GFP_KERNEL)) {
> >               pr_notice("Failed to allocate mask\n");
> >               goto out;
> > @@ -402,7 +402,7 @@ static void leave_uniprocessor(void)
> >       int cpu;
> >       int err;
> >
> > -     if (downed_cpus == NULL || cpumask_weight(downed_cpus) == 0)
> > +     if (!cpumask_available(downed_cpus) || cpumask_weight(downed_cpus) == 0)
> >               return;
> >       pr_notice("Re-enabling CPUs...\n");
> >       for_each_cpu(cpu, downed_cpus) {
> >
> > base-commit: ae46d2aa6a7fbe8ca0946f24b061b6ccdc6c3f25
> > --
> > 2.26.0
> >
>
> Gentle ping for acceptance, I am not sure who should take this.

Looks like Steven or Ingo are the listed maintainers for MMIOTRACE?

-- 
Thanks,
~Nick Desaulniers
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
