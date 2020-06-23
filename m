Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B33D20558F
	for <lists+nouveau@lfdr.de>; Tue, 23 Jun 2020 17:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E806E47B;
	Tue, 23 Jun 2020 15:11:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A006E47B
 for <nouveau@lists.freedesktop.org>; Tue, 23 Jun 2020 15:11:01 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id i1so4908579vkp.8
 for <nouveau@lists.freedesktop.org>; Tue, 23 Jun 2020 08:11:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x/yiaiatgyqr9GiuGAf6Vlbaxc/xMkp1iX8BwvHiw/U=;
 b=ePOf5r/VCBtbo5Eo6g8hMQ0dWSxb9LuvL7WfGRuW4GhJFq5y5yei/4/QgsNyAM/4G6
 xQRZmPcCOvNjCLYR/EkHig8ukny5nn4SXnu7v481NDFHiIoQpgCBw80SrX8332oBm889
 ekmyha4JjzhGnElrhloAiebluyHdakh+gf2JhXhNVx9IpuuMKoRxNO0L6lIQ3ikGVuKV
 zSaxaz1eAU/8nFnztZMOMaAtr148kGnZe+lxhdZ7x11gY2a0qT5pbNsJxBwWSKKmIyb/
 x2cFgIurvgaCa940eXLRv8GktnKCdzwxrRqWOkJvjHJ4MVKMVBML5cmsGR61giwUouJY
 oP5g==
X-Gm-Message-State: AOAM532sjCuvaF5NN9JI3tzbv+ZEXnQMS/UI8lJBGc1keXBx5776GCuP
 Zf3xK9+jQT05YNDaDDifMsCzaF/2SqqR3hT4Xf4=
X-Google-Smtp-Source: ABdhPJyuU03Z2RyJAgYAQp+uciHjHBjjHc9wwhqKtBv2kCmpz8hl7fEIkbgbbH4bygqrLXbOtN8wlley7SmiISKe5J0=
X-Received: by 2002:a1f:9e8a:: with SMTP id h132mr13298038vke.14.1592925060680; 
 Tue, 23 Jun 2020 08:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <CA+7wUswEqHJmmLx+bD4qeLnOEWdhxAK2mt-OXL37-e9NKCuBmQ@mail.gmail.com>
In-Reply-To: <CA+7wUswEqHJmmLx+bD4qeLnOEWdhxAK2mt-OXL37-e9NKCuBmQ@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 23 Jun 2020 11:10:49 -0400
Message-ID: <CAKb7UvhzgbjGjKzCETzLGJFR_H4+CUak88ZuNKK=dKqMoker4g@mail.gmail.com>
To: Mathieu Malaterre <malat@debian.org>
Subject: Re: [Nouveau] Remove debug info from nouveau driver
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

You probably have drm.debug set to something.

On Tue, Jun 23, 2020 at 4:42 AM Mathieu Malaterre <malat@debian.org> wrote:
>
> Hi there,
>
> I am gettings tons of messages in dmesg output such as:
>
> [...]
> [ 2419.238990] [drm:drm_mode_addfb2 [drm]] [FB:65]
> [ 2419.243388] 00a0 2 base507c_ntfy_set
> [ 2419.243391] 00000060
> [ 2419.243391] f0000000
> [ 2419.243393] 0084 1 base827c_image_set
> [ 2419.243394] 00000010
> [ 2419.243395] 00c0 1 base827c_image_set
> [ 2419.243395] fb00007a
> [ 2419.243396] 0110 2 base827c_image_set
> [ 2419.243397] 00000000
> [ 2419.243398] 00000000
> [ 2419.243399] 0800 5 base827c_image_set
> [ 2419.243399] 0007ce00
> [ 2419.243400] 00000000
> [ 2419.243400] 04380780
> [ 2419.243401] 00007804
> [ 2419.243402] 0000cf00
> [ 2419.243408] 0080 1 base507c_update
> [ 2419.243409] 00000000
> [...]
>
> Does anyone know how to remove those extra debug info from nouveau driver ?
>
> For reference:
>
> # cat /sys/module/nouveau/parameters/debug
> (null)
>
> Thanks much
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
