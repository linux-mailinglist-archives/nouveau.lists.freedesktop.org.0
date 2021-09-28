Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DD441ADE1
	for <lists+nouveau@lfdr.de>; Tue, 28 Sep 2021 13:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5886E122;
	Tue, 28 Sep 2021 11:33:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8966E11C
 for <nouveau@lists.freedesktop.org>; Tue, 28 Sep 2021 11:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632828824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u328q7WNSMymaUrmKQOk37LWvJYmT3DIFH6zimZGPjY=;
 b=S6tfrwu/f1o8hyDh5eS01l8cbgIGCE6xtXMuxVdp7MhqbuuYr8v9FnMQ27Z+jUSbRB0p3H
 325KxrLzrc1z94lasMQ3fAQYGQNnquFTZJAz6FK7jdTKzOVvsbqvODh1ldfVfeMAXY3bie
 WAQ3A2pXZCBWbE4yCnzyHmiaJpr5p14=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-jzm7fvGkPxyp-QT3E8uwPA-1; Tue, 28 Sep 2021 07:33:42 -0400
X-MC-Unique: jzm7fvGkPxyp-QT3E8uwPA-1
Received: by mail-wr1-f69.google.com with SMTP id
 c8-20020adfef48000000b00160646ed62cso3391224wrp.18
 for <nouveau@lists.freedesktop.org>; Tue, 28 Sep 2021 04:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u328q7WNSMymaUrmKQOk37LWvJYmT3DIFH6zimZGPjY=;
 b=XiPnZ1Y9IAyNDoTt9nd25ksj+5WzfjAGri8I5cj444n8c0Ij3bdizvneKWxA+qNg5x
 pmBdTxLB0eZgY42ZAFRAwuSg0d3AHDAeJlOgF2xku2YxlVDlq/MiHk16G/DejAqzTfr/
 p2h5EtPEmmOlr0aTykC8nlUmq+x+qBOuRAli9851XQbavfxA3l2Cal3F3niL4MYv5vGC
 YVnBjBoOA3Yz8tt6nsvC7z/4muO2nMwiPMHT4hEDVgMfV+cWjqTiq7Ea282V4uEfK+o3
 CLLjy1Qsz4exDd8fN+RdN6Ld5UECX94tcNaNoUSLq0YsDN8bNFLCsH1ZHTxr05m7QdvS
 cbUg==
X-Gm-Message-State: AOAM530kWBDdKu+HzXJCrq/cNGq8LmBrZeFWMTnhn6wTyM3quwhHhBTq
 nPz3I66lvaGmPv38g6oIGrgVhK/zv9OGeMcmQZFDQVAxMldtWFMxkSCD78+gzQVTw/Y/gx+mzoL
 tJ+P3TZK15ktt1M5qfUX/WiMkhB0FvyD5Dkum8rfElA==
X-Received: by 2002:adf:e44c:: with SMTP id t12mr5899184wrm.49.1632828821479; 
 Tue, 28 Sep 2021 04:33:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzz58XfMdNwS1JsheQmMOCdmsi2kubnksqbD9z+tXbyLb/8yux+PD/EOIxuFTfpkUkADbbnb+9ZEA793Gf+IR4=
X-Received: by 2002:adf:e44c:: with SMTP id t12mr5899164wrm.49.1632828821289; 
 Tue, 28 Sep 2021 04:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210911075023.3969054-1-yangyingliang@huawei.com>
In-Reply-To: <20210911075023.3969054-1-yangyingliang@huawei.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 28 Sep 2021 13:33:30 +0200
Message-ID: <CACO55ttfBAYcLUi7QGFupLFyUQZ2kDet+aABXWA0NVVx+cNEVg@mail.gmail.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 nouveau <nouveau@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH 1/2] drm/nouveau/kms/nv50-: fix file release
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
> Fixes: 12885ecbfe62 ("drm/nouveau/kms/nvd9-: Add CRC support")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/crc.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
> index b8c31b697797..66f32d965c72 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
> @@ -704,6 +704,7 @@ static const struct file_operations nv50_crc_flip_threshold_fops = {
>         .open = nv50_crc_debugfs_flip_threshold_open,
>         .read = seq_read,
>         .write = nv50_crc_debugfs_flip_threshold_set,
> +       .release = single_release,
>  };
>
>  int nv50_head_crc_late_register(struct nv50_head *head)
> --
> 2.25.1
>

