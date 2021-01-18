Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7904A2F9C5B
	for <lists+nouveau@lfdr.de>; Mon, 18 Jan 2021 11:34:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5116E1A3;
	Mon, 18 Jan 2021 10:34:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6C96E1A3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Jan 2021 10:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610966052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FYgCX2ii5Dwe0bOJKcGHpt92B6A/7eyQ87BmmPFfeTo=;
 b=RY0Pr7670RjM8dl1o16xYmXImUvi5mlcLX9CufrkQPgglcQrStJiqbYm6UJxHC5KForPP9
 e/nDDaJnIklHpMJ0YVZ+Sfr+an9V8SyTPW3rjyAeVuAYf5dFOdZ3efV/iOIXcabBPiELmT
 fIQ/tseE2hMkpjnjYazdXiDScynf0mQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-LWdssyB8MGWvaxk5jhoiXg-1; Mon, 18 Jan 2021 05:34:09 -0500
X-MC-Unique: LWdssyB8MGWvaxk5jhoiXg-1
Received: by mail-wr1-f72.google.com with SMTP id w8so8084588wrv.18
 for <nouveau@lists.freedesktop.org>; Mon, 18 Jan 2021 02:34:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FYgCX2ii5Dwe0bOJKcGHpt92B6A/7eyQ87BmmPFfeTo=;
 b=B7KTq/Dg3mVcDIa3Q1wt19YYqeDOb2GzriiX88ZfINvE/z4mi4FelXqJLOqFL+A6jL
 H+KwAAkOQYg1MxFyZHsTFAHIFDs4eOv1v4sRfyyOlIHWgbt9ut5axFbI0pBXo8xIWfdw
 FrBOruRGtw0Pw2T9KNJQjz5WJRsd04q1VeLzmLNAR71yNtKat0kZLwr/DpiugVc7Nl5p
 RQp+58LfxFdCaMc7CvwqL3Em4U8mYOQwxpvmfg/JkNJwCKZhblB012EW/UIoqRSKNBEx
 gjwdW4vzS6mM3gJlgbpyV8Cy12FHRKHpHeWw4s89gADpgVXnHg1W6Ik97yXFTcdbChP4
 ZMvw==
X-Gm-Message-State: AOAM5308r3Xv1TcCh6Ly20sRY3G2kHpYmGD2qKKIw0P2IJ/MOIj5Abc1
 pW9zhj4B8HNiWH5x5c0icJDIzUKsJ/Hn0e/j/ozDkIPdDdPy6Dcl/TwLypHJ78xTbo4gTLuCaCZ
 w0W/zsM+7L5Tfiq4DgV9wX1zspc5UGaVGxITkOsB1zA==
X-Received: by 2002:a05:6000:18a3:: with SMTP id
 b3mr25298764wri.373.1610966048100; 
 Mon, 18 Jan 2021 02:34:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhN7h9yXUe6p7Un37gfh1l909wkVX/yJvjbikxolkUPeB00HrUp7DWinAz6mJJaAmuN4IgACzV2gOW8LmFGaI=
X-Received: by 2002:a05:6000:18a3:: with SMTP id
 b3mr25298742wri.373.1610966047962; 
 Mon, 18 Jan 2021 02:34:07 -0800 (PST)
MIME-Version: 1.0
References: <20210115153348.131791-1-trix@redhat.com>
In-Reply-To: <20210115153348.131791-1-trix@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 18 Jan 2021 11:33:57 +0100
Message-ID: <CACO55tskaWz07cNdvpUE6wQw-7K2qwS8U1sokAeCtAF5naKuSA@mail.gmail.com>
To: Tom Rix <trix@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] tracing: remove definition of DEBUG
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Fri, Jan 15, 2021 at 11:51 PM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> Defining DEBUG should only be done in development.
> So remove DEBUG.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  kernel/trace/trace_mmiotrace.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/kernel/trace/trace_mmiotrace.c b/kernel/trace/trace_mmiotrace.c
> index 84582bf1ed5f..2c3c31791497 100644
> --- a/kernel/trace/trace_mmiotrace.c
> +++ b/kernel/trace/trace_mmiotrace.c
> @@ -5,8 +5,6 @@
>   * Copyright (C) 2008 Pekka Paalanen <pq@iki.fi>
>   */
>
> -#define DEBUG 1
> -
>  #include <linux/kernel.h>
>  #include <linux/mmiotrace.h>
>  #include <linux/pci.h>
> --
> 2.27.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
