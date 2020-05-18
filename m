Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7456F1D8B01
	for <lists+nouveau@lfdr.de>; Tue, 19 May 2020 00:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED65F6E49C;
	Mon, 18 May 2020 22:35:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB70C6E49C
 for <nouveau@lists.freedesktop.org>; Mon, 18 May 2020 22:35:15 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 84B6220674;
 Mon, 18 May 2020 22:35:14 +0000 (UTC)
Date: Mon, 18 May 2020 18:35:13 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Nick Desaulniers <ndesaulniers@google.com>, Linus Torvalds
 <torvalds@linux-foundation.org>
Message-ID: <20200518183513.53b94f11@gandalf.local.home>
In-Reply-To: <CAKwvOdmXgYThHRDpt5dFZy5T1zS6MYQhcBNcq6-rsuc5fjiE6Q@mail.gmail.com>
References: <20200408205323.44490-1-natechancellor@gmail.com>
 <20200518093117.GA719849@ubuntu-s3-xlarge-x86>
 <CAKwvOdmXgYThHRDpt5dFZy5T1zS6MYQhcBNcq6-rsuc5fjiE6Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Sedat Dilek <sedat.dilek@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, 18 May 2020 11:52:47 -0700
Nick Desaulniers <ndesaulniers@google.com> wrote:

> On Mon, May 18, 2020 at 2:31 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > On Wed, Apr 08, 2020 at 01:53:23PM -0700, Nathan Chancellor wrote:  
> > > When building with Clang + -Wtautological-compare and
> > > CONFIG_CPUMASK_OFFSTACK unset:
> > >
> > > arch/x86/mm/mmio-mod.c:375:6: warning: comparison of array 'downed_cpus'
> > > equal to a null pointer is always false [-Wtautological-pointer-compare]
> > >         if (downed_cpus == NULL &&
> > >             ^~~~~~~~~~~    ~~~~
> > > arch/x86/mm/mmio-mod.c:405:6: warning: comparison of array 'downed_cpus'
> > > equal to a null pointer is always false [-Wtautological-pointer-compare]
> > >         if (downed_cpus == NULL || cpumask_weight(downed_cpus) == 0)
> > >             ^~~~~~~~~~~    ~~~~
> > > 2 warnings generated.
> > >
> > > Commit f7e30f01a9e2 ("cpumask: Add helper cpumask_available()") added
> > > cpumask_available to fix warnings of this nature. Use that here so that
> > > clang does not warn regardless of CONFIG_CPUMASK_OFFSTACK's value.
> > >
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/982
> > > Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
> > > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>  
> 
> Thanks for the patch, sorry I'm falling behind on code review!
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Linus sent me a issue about this failure privately as well, and had two
solutions for it (one being identical to this one, and I shared that with
him, and another one he thought would be better, but had some issues).

Linus,

Are you OK with this patch?

-- Steve


> 
> > > ---
> > >  arch/x86/mm/mmio-mod.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/x86/mm/mmio-mod.c b/arch/x86/mm/mmio-mod.c
> > > index 109325d77b3e..43fd19b3f118 100644
> > > --- a/arch/x86/mm/mmio-mod.c
> > > +++ b/arch/x86/mm/mmio-mod.c
> > > @@ -372,7 +372,7 @@ static void enter_uniprocessor(void)
> > >       int cpu;
> > >       int err;
> > >
> > > -     if (downed_cpus == NULL &&
> > > +     if (!cpumask_available(downed_cpus) &&
> > >           !alloc_cpumask_var(&downed_cpus, GFP_KERNEL)) {
> > >               pr_notice("Failed to allocate mask\n");
> > >               goto out;
> > > @@ -402,7 +402,7 @@ static void leave_uniprocessor(void)
> > >       int cpu;
> > >       int err;
> > >
> > > -     if (downed_cpus == NULL || cpumask_weight(downed_cpus) == 0)
> > > +     if (!cpumask_available(downed_cpus) || cpumask_weight(downed_cpus) == 0)
> > >               return;
> > >       pr_notice("Re-enabling CPUs...\n");
> > >       for_each_cpu(cpu, downed_cpus) {
> > >
> > > base-commit: ae46d2aa6a7fbe8ca0946f24b061b6ccdc6c3f25
> > > --
> > > 2.26.0
> > >  
> >
> > Gentle ping for acceptance, I am not sure who should take this.  
> 
> Looks like Steven or Ingo are the listed maintainers for MMIOTRACE?
> 

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
