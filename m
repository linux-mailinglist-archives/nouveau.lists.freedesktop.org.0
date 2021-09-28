Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FE041ADE7
	for <lists+nouveau@lfdr.de>; Tue, 28 Sep 2021 13:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C79D6E072;
	Tue, 28 Sep 2021 11:34:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C6C6E072
 for <nouveau@lists.freedesktop.org>; Tue, 28 Sep 2021 11:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632828889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M/E3G8A3gYE+U2dreASmQnyRqiphlZRJm1ekOxiW/BA=;
 b=Db/jIBEtXpIF0syeXJbAx/fFMLc5JI7+RsqWEmh46it7oWi0AOI1QcAus/tgJiScHEGby/
 OILD7U7ibUKB5okAl/haMvaLNPh2eF+lVSeTAEDOQIv/3mTCkTJTDfzRzPROCY0xMVnrni
 9tjdiooy0kbzEExK2lNIQetfO+zoD5Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-ZFdZmCq2O-iVDo5xJYmwSA-1; Tue, 28 Sep 2021 07:34:48 -0400
X-MC-Unique: ZFdZmCq2O-iVDo5xJYmwSA-1
Received: by mail-wr1-f71.google.com with SMTP id
 a10-20020a5d508a000000b00160723ce588so424193wrt.23
 for <nouveau@lists.freedesktop.org>; Tue, 28 Sep 2021 04:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M/E3G8A3gYE+U2dreASmQnyRqiphlZRJm1ekOxiW/BA=;
 b=dqpb+2w54AgnBxh1JTnv4+vtnQTN9SIRXH43L5MrzIT7wUm2EwwJYyOwtMPya6YtUV
 VvRCrNWHUXPJu74V/eXMk7rJhW6+v3yQMQsiSXOIfkC5nEEySz7YECr2KJIZFsQlyzC7
 AoVhnIhj7cwxvxxryyc/gZlW3wRtwvXoHZMP+ZwL3E2xVq9HYpSzrTJGOVZXb4P1OIrZ
 2B8jhm1dRgkwgYD1/nr7yv3EA+QFwmXO1AsNZPlqirYJwWpofKW2NQ7mlkp5u5xX4zh6
 eM6xWgxYr/lbQ/e/5LbneufO57QXU60qAfRKVHXvhgqbDKh0BjqmK/A4LSPJCHirbEaM
 kMTA==
X-Gm-Message-State: AOAM533Hv28XSKW/v6CVmpBLkvve+BsiefT+DOHrvdf/KuAlEWXCxw84
 FOdk5By1Z4w1tOll2SRUqdSey+PudDiE8mdsTlLWJYrMrSe/ZCpRr0ILuycwQbpgdAr7xpnQ4uh
 E4iRyAtGly8g+tIZNE1P3dRukGDNKamGxyKt3LynsNw==
X-Received: by 2002:adf:e684:: with SMTP id r4mr5880464wrm.229.1632828887296; 
 Tue, 28 Sep 2021 04:34:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJys6dX122BOsP5c995TAAKHZg1HhiNlNbb3SH87eApAz3oYL6keGkax7mwj4JY6pjNM9VZ/avus/dM3dwa+cIU=
X-Received: by 2002:adf:e684:: with SMTP id r4mr5880447wrm.229.1632828887161; 
 Tue, 28 Sep 2021 04:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210911075023.3969054-1-yangyingliang@huawei.com>
 <20210911075023.3969054-2-yangyingliang@huawei.com>
In-Reply-To: <20210911075023.3969054-2-yangyingliang@huawei.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 28 Sep 2021 13:34:36 +0200
Message-ID: <CACO55tsKcZjB_9E-QfbDY99LT+w_fgssONjEd-qymoSCe0Z7qw@mail.gmail.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 nouveau <nouveau@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH 2/2] drm/nouveau/debugfs: fix file release
 memory leak
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

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Sat, Sep 11, 2021 at 9:45 AM Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> When using single_open() for opening, single_release() should be
> called, otherwise the 'op' allocated in single_open() will be leaked.
>
> Fixes: 6e9fc177399f ("drm/nouveau/debugfs: add copy of sysfs pstate interface ported to debugfs")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> index c2bc05eb2e54..1cbe01048b93 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> @@ -207,6 +207,7 @@ static const struct file_operations nouveau_pstate_fops = {
>         .open = nouveau_debugfs_pstate_open,
>         .read = seq_read,
>         .write = nouveau_debugfs_pstate_set,
> +       .release = single_release,
>  };
>
>  static struct drm_info_list nouveau_debugfs_list[] = {
> --
> 2.25.1
>

