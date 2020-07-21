Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1423E228435
	for <lists+nouveau@lfdr.de>; Tue, 21 Jul 2020 17:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F58B6E2E0;
	Tue, 21 Jul 2020 15:50:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379EE6E2E0
 for <nouveau@lists.freedesktop.org>; Tue, 21 Jul 2020 15:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595346630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T1eqkdT+65WSXffQEgvHX8BA45HzVx3nhgyMOFl0KCM=;
 b=LaYF60e0KXJEDIndIULbNIKJJGrYHojZVIFeXwzRJkawj6MCFNp1hKyxPOtU4Bz6Z+tdnM
 dmfTqRxB3yBgPEsxlOXllY8kXxtSb0MjbGzWjn+8J+4SG5lHhZUAHygZrd2wn2O91agrdK
 ViLmpxZ2pBmzHyvzlqX70JMPAimF/gM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-f9FKtYZJP2-G4DnWfEqRIA-1; Tue, 21 Jul 2020 11:50:23 -0400
X-MC-Unique: f9FKtYZJP2-G4DnWfEqRIA-1
Received: by mail-qt1-f200.google.com with SMTP id m25so14645688qtk.1
 for <nouveau@lists.freedesktop.org>; Tue, 21 Jul 2020 08:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=T1eqkdT+65WSXffQEgvHX8BA45HzVx3nhgyMOFl0KCM=;
 b=ZcA/Vg+dpr1r2zgys5cPEt76/P5r/keFsX2ZrZeotDf/1DYu7EKATUmeyiN0Y6FiVH
 y82jjFFUlCu3VLGHS/amcfLCU8ZT7dvUrHZW+x/o4ZCJywDE7/23xctgkFLdIoxHQgGA
 nI1gvj/iW1GS0yK9bvEjNBazbFBUMEt2x40zX4Z7XMDEGerTrM1I1+1UZ9jUiUz7L1pw
 jZLgxGF1K6AQm7V4f2bLP00oOn6JIkuJLzAr+M6vbj4kwWZP2xzSDK8nGT+zRESxL030
 dQ2tMiIjEBk7DZm/pt4bIkVpH3aDJgi9lEyCyfCgtqeyyIetbIaJlqxU1MwxBNxCvGib
 K7Cw==
X-Gm-Message-State: AOAM5336E5xdJj3WWaN9yICJoTISY3eE429hktRwMwATtkuSqhTFQvur
 Udct6ydijimw+5VfNPAVApL+xkBWUyAtndO5AX2pcMyXsqHHqxVxvUlnj0OejIYTxL7I9uKDFUD
 xbjZ0BSjGmaU1eA4CkiEzSrHv1g==
X-Received: by 2002:aed:2f46:: with SMTP id l64mr29601837qtd.1.1595346622841; 
 Tue, 21 Jul 2020 08:50:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRfxmS1vh9brmkhzM4t8kBfNgHEn/slIPecHCsCE4ib2gN5E/VVud9VW0vl+hQQ4YSUuRZ2Q==
X-Received: by 2002:aed:2f46:: with SMTP id l64mr29601827qtd.1.1595346622609; 
 Tue, 21 Jul 2020 08:50:22 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id m17sm202763qtm.92.2020.07.21.08.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 08:50:21 -0700 (PDT)
Message-ID: <4e90a54c61e3ecb19802d7ea811c58a51ac457ed.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Wei Yongjun <weiyongjun1@huawei.com>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Dave
 Airlie <airlied@gmail.com>
Date: Tue, 21 Jul 2020 11:50:20 -0400
In-Reply-To: <20200721151701.51412-1-weiyongjun1@huawei.com>
References: <20200721151701.51412-1-weiyongjun1@huawei.com>
Organization: Red Hat
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH -next] drm/nouveau/kms/nvd9-: Fix file release
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Thanks!

On Tue, 2020-07-21 at 15:17 +0000, Wei Yongjun wrote:
> When using single_open() for opening, single_release() should be
> used instead of seq_release(), otherwise there is a memory leak.
> 
> Fixes: 12885ecbfe62 ("drm/nouveau/kms/nvd9-: Add CRC support")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/crc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c
> b/drivers/gpu/drm/nouveau/dispnv50/crc.c
> index f17fb6d56757..4971a1042415 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
> @@ -706,6 +706,7 @@ static const struct file_operations
> nv50_crc_flip_threshold_fops = {
>  	.open = nv50_crc_debugfs_flip_threshold_open,
>  	.read = seq_read,
>  	.write = nv50_crc_debugfs_flip_threshold_set,
> +	.release = single_release,
>  };
>  
>  int nv50_head_crc_late_register(struct nv50_head *head)
> 
> 
> 
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
