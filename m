Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2088F4BD30E
	for <lists+nouveau@lfdr.de>; Mon, 21 Feb 2022 02:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D98B10E2C9;
	Mon, 21 Feb 2022 01:12:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752E510E4E1
 for <nouveau@lists.freedesktop.org>; Tue, 15 Feb 2022 18:17:42 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id qe15so18049239pjb.3
 for <nouveau@lists.freedesktop.org>; Tue, 15 Feb 2022 10:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=rU/cr+2YS83r8ZzfG0ihHyfke5lY7dzNO33vRqwTRo0=;
 b=BbY3zUMbpsKVLuD6QiFaFpnxej58wpxQPVVGisDcf+K+2coTsFmZNXGoWqBeKoLb1x
 3ZptFg7el6LpqeSuHR1QjwuSCHfpkEX/T+XcjAHpaQzkvx2kHT7d0+kYGoaayuMfQhPV
 CAs5kcpK7DDzn/NDlTFukbq1xe316LjUYcWLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=rU/cr+2YS83r8ZzfG0ihHyfke5lY7dzNO33vRqwTRo0=;
 b=SEBXPhfwq/Nf9DD+CCH19Ob+gq4/7K+n9gLDfIk4PaN+21SLAYAu7+bgQ4QtTDHcX7
 hwVL/Jnt6ryzsF0n0pALE14YVTZGDZHNxGaaFM9KQ9/pQ/9PayUfWLu81YUPrju0fJW1
 ucAM7XHNXEJb5RvJg5V1KZ+7Zud+MMhJ/6CpLGYujQz2A9TLyGkb++zUzN5N8QWYCBaQ
 uFscMljUPfWEgqyEb7v7xH93aG/sxgoR6q+D+nKbkQ5xPZ6bDxcv+/lGtiJzsJmIfcwm
 jdpme+RhRA4xnQgaLEL5FAe95qlEYBuVYJqlLAYjK782YvF/nZOovur6tOtxNFZIt6HZ
 3p4w==
X-Gm-Message-State: AOAM531KMqnek70CwRxa6IdNc8nVfSNOoacmn6CHbmWh0BWTzZBNMVp9
 n5zYDbahCGu/ZBaAyZgpoIocSQ==
X-Google-Smtp-Source: ABdhPJwjJJkj0fC2gO+FdGjnaisWCk9FKkCf0qazg7PUuY4rrjoW+egyeLOWB+yCEr/MI5qa+9+dbA==
X-Received: by 2002:a17:902:eb8f:: with SMTP id
 q15mr235036plg.67.1644949062021; 
 Tue, 15 Feb 2022 10:17:42 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id a186sm3157627pgc.70.2022.02.15.10.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 10:17:41 -0800 (PST)
Date: Tue, 15 Feb 2022 10:17:40 -0800
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Message-ID: <202202151016.C0471D6E@keescook>
References: <20220215174743.GA878920@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220215174743.GA878920@embeddedor>
X-Mailman-Approved-At: Mon, 21 Feb 2022 01:12:29 +0000
Subject: Re: [Nouveau] [PATCH][next] treewide: Replace zero-length arrays
 with flexible-array members
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
Cc: alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 devicetree@vger.kernel.org, target-devel@vger.kernel.org,
 linux-hardening@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-acpi@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-ext4@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-xtensa@linux-xtensa.org,
 mpi3mr-linuxdrv.pdl@broadcom.com, coresight@lists.linaro.org,
 sparmaintainer@unisys.com, linux-um@lists.infradead.org,
 greybus-dev@lists.linaro.org, linux-rpi-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devel@acpica.org, linux-cifs@vger.kernel.org, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, GR-QLogic-Storage-Upstream@marvell.com,
 linux-crypto@vger.kernel.org, linux-alpha@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Feb 15, 2022 at 11:47:43AM -0600, Gustavo A. R. Silva wrote:
> There is a regular need in the kernel to provide a way to declare
> having a dynamically sized set of trailing elements in a structure.
> Kernel code should always use “flexible array members”[1] for these
> cases. The older style of one-element or zero-length arrays should
> no longer be used[2].
> 
> This code was transformed with the help of Coccinelle:
> (next-20220214$ spatch --jobs $(getconf _NPROCESSORS_ONLN) --sp-file script.cocci --include-headers --dir . > output.patch)
> 
> @@
> identifier S, member, array;
> type T1, T2;
> @@
> 
> struct S {
>   ...
>   T1 member;
>   T2 array[
> - 0
>   ];
> };

These all look trivially correct to me. Only two didn't have the end of
the struct visible in the patch, and checking those showed them to be
trailing members as well, so:

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
