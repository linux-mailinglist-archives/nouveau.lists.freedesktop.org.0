Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7153FE571
	for <lists+nouveau@lfdr.de>; Thu,  2 Sep 2021 00:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68F06E3E3;
	Wed,  1 Sep 2021 22:25:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDD06E3EB
 for <nouveau@lists.freedesktop.org>; Wed,  1 Sep 2021 22:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630535103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7YIPDdvKlZ7dKyhd3N2xMIdgQPKAjpqA9QdSJUxdfeQ=;
 b=TgrKg96FTmx6K5j6uSjQSykfjUTA6/NB/AbnP8DAODWyR6kCemfnRcpY8BASe+mmy9dsGb
 dJVNQqwO3k7HCdA3pIVAcng4E+pCARXiEqW2nWSdPe8PZ2jaY1TkgBqfKLtgdjypVIXfSV
 y/AM8/JxZh54w8pnBwbImED86D5lbNE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-9GyH0Fm-M8igAyI6m3aHnA-1; Wed, 01 Sep 2021 18:25:02 -0400
X-MC-Unique: 9GyH0Fm-M8igAyI6m3aHnA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so420951wma.4
 for <Nouveau@lists.freedesktop.org>; Wed, 01 Sep 2021 15:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7YIPDdvKlZ7dKyhd3N2xMIdgQPKAjpqA9QdSJUxdfeQ=;
 b=BqYC7M6ggtjCS/NT8TPboVJ/KjJCV6g2RtudcCnsivnWzDQHKByuaE0JOR14lRiq80
 xqOSdvXKzb+i+YzKodLwCxZM7nGTL9FHVcq+F1iYpxhVFHYWEXLSqg0QnKMs1FgZLpDq
 Z+kOQsbwmP8bisySzo9GeJE4ivP3MtifWU/w8L0/WZkQSjg20C+Ek7MrHlr+S3j9LGqQ
 H/fWc0pEOHkCme+YA+5ONKW+LTr7ig5F621WZL09sWqRrmODlAa1zUURWjc6iLKbqGKK
 6sGJVRA8rE3X14sPdvN0wmdPz+JdbhrAoKxOuJzi+eN0med5ahCLj0+mPFjDaS+QiV0S
 Rkzg==
X-Gm-Message-State: AOAM532uFjPSXC9Kd+fdNlMD863QZOw9SU2gvHNRkW+rRdR1RMGR94Gw
 WKnPBk9ddX1kahXDpYhiP4bgxjbX6IfPXrSfEADk+rdXmmc4hQUI2Un4l0vkTqNtgmeNslHsXeS
 454DZhnr9FrxjY0tUslGm10cRxy9FfMH+fYZBCV8e5Q==
X-Received: by 2002:a7b:c192:: with SMTP id y18mr112265wmi.163.1630535101647; 
 Wed, 01 Sep 2021 15:25:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPJQaDDVD4rvob13BCGbmQBHVzY+mM7L72Q4FS9DwXZ9v5YFYIILHyd5N1l91UskZqMBff5hYh6J5XgkiIKDs=
X-Received: by 2002:a7b:c192:: with SMTP id y18mr112257wmi.163.1630535101413; 
 Wed, 01 Sep 2021 15:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <d9e232668dee230a02206baf2c528c67b9c1ec6d.camel@firszt.eu>
In-Reply-To: <d9e232668dee230a02206baf2c528c67b9c1ec6d.camel@firszt.eu>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 2 Sep 2021 00:24:50 +0200
Message-ID: <CACO55tviKOiQk3DmxNFhMTHVAZC4gT4VUvPqRWLRa8eDb9bGRA@mail.gmail.com>
To: Przemo Firszt <przemo@firszt.eu>
Cc: nouveau <Nouveau@lists.freedesktop.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] RTX 3070 / NV174 / GA104 - is there any development
 happening?
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

On Wed, Sep 1, 2021 at 11:19 PM Przemo Firszt <przemo@firszt.eu> wrote:
>
> Hi,
>
> Can you advise if there is any work happening on NV174 / GA104 (market
> name RTX 3070)? I checked the features matrix and searched the code of
> kernel, mesa, libdrm and xf86-video-nouveau. The only thig that seems
> to be ready is kernel mode setting and the only piece of code showing
> any results when searching for the code names is the linux kernel:
>
> $ grep -ERi 'ga104|fv170|fv174'
> grep: linux/.git/objects/pack/pack-
> ab4e07c9b3c4ddb7ed2970684121a5c4b7ddfb1d.pack: binary file matches
> linux/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c:        .name
> = "GA104",
>
> Is there any developmen happening in the public space? I'd like to
> support it (coding, testing, donating money) as I have a laptop with
> that card.
>

Sadly there isn't much you can do right now as the next step is to
wait until Nvidia releases and publishes firmware files in order to
enable acceleration in Nouveau. Once that happens we will enable
OpenGL on those GPUs and then everybody is welcomed to report bugs and
so on. But atm it just stalls on the initial enablement of those
pieces. The firmware would land in the linux-firmware repository under
nvidia/ga104 for your GPU.

> --
> Kind regards,
> Przemo Firszt
>

