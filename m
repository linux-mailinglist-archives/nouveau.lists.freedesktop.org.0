Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E97E71B835A
	for <lists+nouveau@lfdr.de>; Sat, 25 Apr 2020 04:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7446EB97;
	Sat, 25 Apr 2020 02:52:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7961B8984D
 for <nouveau@lists.freedesktop.org>; Wed,  8 Apr 2020 21:37:01 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c195so1057028wme.1
 for <nouveau@lists.freedesktop.org>; Wed, 08 Apr 2020 14:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=q4sLyktfrOExuEZEYqjNYRWtmjYeOihRLdSqSzM0jBQ=;
 b=Hco7MSfhBD/kWrXXtSZaT1Uq3HYjzmA4BWBwNBTzpupRmSLiC2ehWSbJaPcx3LKRRE
 CQqagdrVOrJ/io0IH4/tm+to4FWYgZe/eGUtOcscYiApxnKXriXLXv38HTjEeEg/PCPa
 7jH3H1kS+tK3/P0PTvbiMQjfiXJAXQqygCxS1+ZIWRhUZOifADjfUPbjizrY86rqz0tb
 +M0lWtS/+Szy0sKswMs5UQEYcEWqLtVp3Vh2Ihc3s//nQfufc7sK+LtMin3WlJxTAeFy
 /ApET9dWMGVw+ovEvY5VB98kZNucRGPdwWZYkGZcPszR413B2k6Vw0JUiCaVw+zujUxK
 x0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=q4sLyktfrOExuEZEYqjNYRWtmjYeOihRLdSqSzM0jBQ=;
 b=tvWtDyOJutsgle+ECoB2VzIc/7XnGOeG3j7+oQYPKAwg2pyY+iTk50wZVz/JdeaIqy
 ytImJjoIXHl4Q+8kPS30THMmuI+qNivv9oF13ES+8tftEDjAgZk8hRJ372q7aQ9Z/anZ
 kiRvxNphlBsy9M6GbN6+SkNC1LdZzfFvWuXzqm2yJWh/0E2UC2aqUn+NtAO+VsYI2kWn
 KfSaUyANAoRztf/kFeG9PS2fcdkYmBO7i7IUhGdFRTlh6v81oG106C6+tT7JZueuRUl8
 iu6qcklgtl3egjLFtOEnn5dL6AdwmaIGKLuY5rRU7awtXIvteH5lArMjrsXCOwDEZUeb
 FbxQ==
X-Gm-Message-State: AGi0PuZNMpe7VjE3FwzHEkYtzFefwY/Pdfix8rlcOzZB3pjeARfylvOx
 PSU/28lLrNPdP3+0U+U6nO/0kMLGvXR1i9HyBxU=
X-Google-Smtp-Source: APiQypKkyO/X4F3zpkuwxZGJdH1jCd8hOH5NdPfJtHGzrLYyMWWO6zubYykoEYC7/vylnfuleQnGTAC7qDAAd4gYDiA=
X-Received: by 2002:a7b:cb86:: with SMTP id m6mr6258988wmi.64.1586381820060;
 Wed, 08 Apr 2020 14:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200408205323.44490-1-natechancellor@gmail.com>
 <CA+icZUUTEEZww3qT0jfFP0ZgUPXoF1_uOHMT4ZecrQxumE1Zmg@mail.gmail.com>
In-Reply-To: <CA+icZUUTEEZww3qT0jfFP0ZgUPXoF1_uOHMT4ZecrQxumE1Zmg@mail.gmail.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 8 Apr 2020 23:36:47 +0200
Message-ID: <CA+icZUWq=_qjvAf40PqQAj3tQ0WAZ2QAR9hojTuYqZH_=RWd_w@mail.gmail.com>
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

On Wed, Apr 8, 2020 at 11:12 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Wed, Apr 8, 2020 at 10:53 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > When building with Clang + -Wtautological-compare and
> > CONFIG_CPUMASK_OFFSTACK unset:
> >
>
> Hi Nathan,
>
> thanks for the quick patch.
>
> I can confirm I have no CONFIG_CPUMASK_OFFSTACK set.
>

Feel free to add appropriate credits:

   Tested-by: Sedat Dilek <sedat.dilek@gmail.com>

Regards,
- Sedat -

>
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
> > ---
> >  arch/x86/mm/mmio-mod.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/x86/mm/mmio-mod.c b/arch/x86/mm/mmio-mod.c
> > index 109325d77b3e..43fd19b3f118 100644
> > --- a/arch/x86/mm/mmio-mod.c
> > +++ b/arch/x86/mm/mmio-mod.c
> > @@ -372,7 +372,7 @@ static void enter_uniprocessor(void)
> >         int cpu;
> >         int err;
> >
> > -       if (downed_cpus == NULL &&
> > +       if (!cpumask_available(downed_cpus) &&
> >             !alloc_cpumask_var(&downed_cpus, GFP_KERNEL)) {
> >                 pr_notice("Failed to allocate mask\n");
> >                 goto out;
> > @@ -402,7 +402,7 @@ static void leave_uniprocessor(void)
> >         int cpu;
> >         int err;
> >
> > -       if (downed_cpus == NULL || cpumask_weight(downed_cpus) == 0)
> > +       if (!cpumask_available(downed_cpus) || cpumask_weight(downed_cpus) == 0)
> >                 return;
> >         pr_notice("Re-enabling CPUs...\n");
> >         for_each_cpu(cpu, downed_cpus) {
> >
> > base-commit: ae46d2aa6a7fbe8ca0946f24b061b6ccdc6c3f25
> > --
> > 2.26.0
> >
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
