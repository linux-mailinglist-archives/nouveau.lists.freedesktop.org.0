Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6231D7412
	for <lists+nouveau@lfdr.de>; Mon, 18 May 2020 11:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E6489580;
	Mon, 18 May 2020 09:31:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D4F89580
 for <nouveau@lists.freedesktop.org>; Mon, 18 May 2020 09:31:19 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id w4so4549603oia.1
 for <nouveau@lists.freedesktop.org>; Mon, 18 May 2020 02:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=O6tYQNQfN78A6bzbWtio5TYkldgCYo0BB7b2XSCJBMk=;
 b=T1TMree/1YLPWrkoq6Z8petN+kO36f1BK6/qBviVqTSj9mMWyqRORWclISpps35h+/
 IHe9pE5b/ZaRNkXr0REpmeeIDYWGMV93n/BLobJQoC1iLbLzsbwnHUCiyVsiIGI+CtL9
 KOalfjWxuoYgUhalQOGVHrfPz4xk0ToUQg0YMjUzVzyHlGT+5v6A+LNVcaCo5bcRX/8O
 HTbJTb+WrRhkreT8gS2wx9VuY2dYFxjMiqUP//uChmfa99BM8Orc4a+a7RxNP5/3ypuu
 WyJNHUsDXlYGIVcpZN+0Ysny7s1mHbOIAI7i9c98HVoCJnS2ru6+zQzdG+yXrhHRGPgh
 DreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O6tYQNQfN78A6bzbWtio5TYkldgCYo0BB7b2XSCJBMk=;
 b=NO9dFFCvBkUdyA5qHpOamnnNmIT5SQtteOwFSe3BBTxVTGy27QaUAGseXT76cp0gul
 yCJ+no0l6crQGz62PkXDXoQ7yY5sp8xgklw7IYe80WB9uJi3D2S/UDzMeUxN41Jn6QuP
 XkGoJOcbA+EPT08P0Ljovr9x2VGDLEd29cDlixH3teKeGbTUZa8Rmd9Ij9CCbAoRWgn8
 MzRlMuShVfx7YWgL8zX0bDSBK4wVQbvn8lMqyKcLhkxVdYZfmYwbbjY4ksgkMXr3NyUD
 qFWvsa96ciQ1Px+7wieH/v3fqre6iR9YrNcYai/G6F0K99Du/YIRRTRh9asEm9pSLZvs
 t37Q==
X-Gm-Message-State: AOAM533ZrPv5DKgSzrGXb4jC4/Da9dHFQJkYou1j7JAnaC+j6B/t0wYw
 E+KgVWXCkzF9fq94+kvTy1M=
X-Google-Smtp-Source: ABdhPJzKm7BZT5vgWhPubWJimcr9S3wPHuSJt7UgfTouHp6vSHFYodla2PbiA01meAkR+JRV9bEvoA==
X-Received: by 2002:aca:f551:: with SMTP id t78mr10568633oih.24.1589794279115; 
 Mon, 18 May 2020 02:31:19 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id s69sm2810432otb.4.2020.05.18.02.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 02:31:18 -0700 (PDT)
Date: Mon, 18 May 2020 02:31:17 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@kernel.org>
Message-ID: <20200518093117.GA719849@ubuntu-s3-xlarge-x86>
References: <20200408205323.44490-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408205323.44490-1-natechancellor@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Pekka Paalanen <ppaalanen@gmail.com>,
 Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Apr 08, 2020 at 01:53:23PM -0700, Nathan Chancellor wrote:
> When building with Clang + -Wtautological-compare and
> CONFIG_CPUMASK_OFFSTACK unset:
> 
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
>  	int cpu;
>  	int err;
>  
> -	if (downed_cpus == NULL &&
> +	if (!cpumask_available(downed_cpus) &&
>  	    !alloc_cpumask_var(&downed_cpus, GFP_KERNEL)) {
>  		pr_notice("Failed to allocate mask\n");
>  		goto out;
> @@ -402,7 +402,7 @@ static void leave_uniprocessor(void)
>  	int cpu;
>  	int err;
>  
> -	if (downed_cpus == NULL || cpumask_weight(downed_cpus) == 0)
> +	if (!cpumask_available(downed_cpus) || cpumask_weight(downed_cpus) == 0)
>  		return;
>  	pr_notice("Re-enabling CPUs...\n");
>  	for_each_cpu(cpu, downed_cpus) {
> 
> base-commit: ae46d2aa6a7fbe8ca0946f24b061b6ccdc6c3f25
> -- 
> 2.26.0
> 

Gentle ping for acceptance, I am not sure who should take this.

Cheers,
Nathan
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
