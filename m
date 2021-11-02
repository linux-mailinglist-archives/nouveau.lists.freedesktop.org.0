Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7B8442514
	for <lists+nouveau@lfdr.de>; Tue,  2 Nov 2021 02:24:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 002846F546;
	Tue,  2 Nov 2021 01:24:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7B76F546
 for <nouveau@lists.freedesktop.org>; Tue,  2 Nov 2021 01:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635816283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d+8t+i0Gd3MPbVRCnRNisUB4JNqxi1cUeT9qw48JHr8=;
 b=Zu1cFLL8sDBLraA9Boll+XeY7+w48s0CZTYIRwV9z8zBFmzlcjk96a8I2O88VpZLkCYzqz
 gezZQx/shka7wE8waWaiyar0Vxb2OUiobaNm+qTQRuRMBaIvxwMdXk6KwIUzgoylFaDbw5
 XsZzhoLT3pBMG3Ic67gCmfWYludd/4A=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-J8PfHx3HNYmmH7oEyZW4pA-1; Mon, 01 Nov 2021 21:24:40 -0400
X-MC-Unique: J8PfHx3HNYmmH7oEyZW4pA-1
Received: by mail-lf1-f69.google.com with SMTP id
 t62-20020a19c341000000b004000224ab0cso2457660lff.8
 for <nouveau@lists.freedesktop.org>; Mon, 01 Nov 2021 18:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d+8t+i0Gd3MPbVRCnRNisUB4JNqxi1cUeT9qw48JHr8=;
 b=dIAj76cMKHawy6KYM6f7cdRygBp2Jj04cDiGv2TuG0t/Z8v1JndqZBXGAT1syOFcP3
 1uPizvpC6acdvfjDQrCU1jZ0gCfLEWOo963u/3n8Avmv74Ihe5JHa5QxlZLMwGgxbyWr
 2vVnZ+VAy325ZrL7EdC5bzyHibqpQG3Tnh8V2WqwUyLRjfVBgCHtw6jImPZBE4hStm08
 2pUn8MIjYATSZlSQUcKoJlu6EGu8Ne3j1H4khqVVhVgWJJM09gR5dthk/4rLkD9an1Wp
 YBYkpC9TZGZDIh6EJr2D+4iXUakOQraQftjOHwKK+7FjB7u6N6EnY1sKAjAPzg0clzL7
 AFCg==
X-Gm-Message-State: AOAM530Wc8JEH7DfZnRN0srgSKTeAF9o9h4Ea1eg4ogCiF9jq56LrQed
 AK9rH6GruiQuRve5wbNpEncxCnpCheFJrTL6hyi7CLt+WIT5DS0/8oQYwuJ30+LL7/qpSCc2WXh
 hZXMm11gw38KwhdB1USUmV5L+ZrNXpZQ11dH/awgh2g==
X-Received: by 2002:a05:651c:a0b:: with SMTP id
 k11mr17275772ljq.446.1635816278986; 
 Mon, 01 Nov 2021 18:24:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxB5ZiEgtQ7g8ICRneDBtPjtFB4UYgveLq+L7tMK06dL9NNkOZlu5chvQJu7iep6NIIT80MiKz8IKwtdWdqGwg=
X-Received: by 2002:a05:651c:a0b:: with SMTP id
 k11mr17275741ljq.446.1635816278690; 
 Mon, 01 Nov 2021 18:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <4a8b1573-3cd6-19cc-b18b-588d7d8283d9@gmx.net>
In-Reply-To: <4a8b1573-3cd6-19cc-b18b-588d7d8283d9@gmx.net>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 2 Nov 2021 02:24:25 +0100
Message-ID: <CACO55tun0ohXCNV_3o3eZozs7+ehy-Bv0_cxP+uaOMFgwkq_Nw@mail.gmail.com>
To: "Linux User #330250" <linuxuser330250@gmx.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] hardware donation
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Oct 26, 2021 at 9:56 PM Linux User #330250
<linuxuser330250@gmx.net> wrote:
>
> Hello!
>
> I have a ThinkPad T61 with an Nvidia Quadro G86M [NVS 140M] graphics
> card. Recently the nvidia binary driver, version 340.x, has been removed
> from most Linux distributions, forcing the use of nouveau.
>
> In the past, when nouveau was unstable/unusable, people moved to the
> binary driver. Since this in no longer an option, nouveau is now the
> only option. And I'm totally okay with it, I would have prferred an open
> source solution anyway... BUT.
>
> BUT nouveau is unstable. I experience random freezes, like others too:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=995866
>
> The only option was to use nomodeset and to have an unaccelerated
> graphics output. But if you want to use the laptop as a desktop machine,
> this is not much fun.
>
> Long story short, the question I have:
>
> According to https://nouveau.freedesktop.org/HardwareDonations.html such
> a graphics card could be of use?
>

If you are willing to give away the system anyway, it might make sense
to retest with recent software, like newest Fedora or debian sid. We
usually fix bugs, but often fixes are not added downstream. And I
think the issue shown in this bug is actually fixed already as I
remember seeing something like this and we fixed it.

If the issue is still there with a recent kernel (newest 5.14 or even
5.15) we can look into it.

Thanks

> Thanks,
> Linux User #330250
>

