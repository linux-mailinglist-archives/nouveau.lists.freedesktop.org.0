Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C88349BBDB
	for <lists+nouveau@lfdr.de>; Tue, 25 Jan 2022 20:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE4710E3ED;
	Tue, 25 Jan 2022 19:11:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CC810E451
 for <nouveau@lists.freedesktop.org>; Tue, 25 Jan 2022 19:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643137915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L6O4DkR4pkiSXBoigUMOsmjUeRpgHJTXKdhZ+nj+Qmo=;
 b=UgGPjdl5i9cbLUq/NMmeIF+YodUpZDJgSC9pQbZqnMGSr0wLjexYsoqfGctViu7zA2fXop
 az7+TyXDh3O1vj4CQeir0rUN7pZBNHbWAVtaMG2wffTz3QYrHc1ASsJ+zsG1KlISoqhyYj
 6JHM2Ak+OSRowOFfO8Z7AGEsJh8o7ww=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-4cbHqURmMXiV9Sd1RBDKnA-1; Tue, 25 Jan 2022 14:11:54 -0500
X-MC-Unique: 4cbHqURmMXiV9Sd1RBDKnA-1
Received: by mail-qv1-f69.google.com with SMTP id
 6-20020a0562140d4600b004244d191fd4so4413707qvr.0
 for <nouveau@lists.freedesktop.org>; Tue, 25 Jan 2022 11:11:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=L6O4DkR4pkiSXBoigUMOsmjUeRpgHJTXKdhZ+nj+Qmo=;
 b=pjNDaQf+xVRl6Zvo9K6GBOlnmLGKaTJo8/udmW3EPkV2bcjmo1PApdJbfAAweUC23Z
 LzJjsElkoV7TOCQJbh/jmkjDL4PVraPXIx5suSOmBLitnj6qQD/yQ8B3KSCuXSdSIgzJ
 RNKJ8+zlgVPITsim0T3hUAYdMwk+6EPnwgCXu6uvVzHnD9CZs/uYTxtTNLFdsVb657Fd
 DuWQB+5ckOH556fNN5kFskpxQF65ZjLSQ27s9G447WcYyyvw83jMMTf+rGVXcMkYhHCl
 XvVddCIjCYdUCTjBBcN1CIbwIfy15cKgFDH22Syc83FGOuqvN8RttQTUgflB3hP3dmh5
 VZtg==
X-Gm-Message-State: AOAM530rZJCs+IbBClv6aq2ftkK3wSNQjLMpKLioE2b206tED/9+HKjz
 dM6PLO1ajkXe+Td395iZQXGe84g9NHEkOdg6h+9qi2umhnSWdXfH7HKsFtgorYJ2m/cWwNxLCKC
 wVTPPnrXd3+CSX+bIMjjfS9TYyQ==
X-Received: by 2002:a05:6214:629:: with SMTP id
 a9mr20865496qvx.110.1643137913986; 
 Tue, 25 Jan 2022 11:11:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTyeEPxlKSHce5gJ4OzKH9x9AC06WyRvPSC70RRpnsuw3uVK9P/wNr8ukPE4ZiYev98vFTRA==
X-Received: by 2002:a05:6214:629:: with SMTP id
 a9mr20865470qvx.110.1643137913719; 
 Tue, 25 Jan 2022 11:11:53 -0800 (PST)
Received: from [192.168.8.138] (pool-98-118-105-43.bstnma.ftas.verizon.net.
 [98.118.105.43])
 by smtp.gmail.com with ESMTPSA id d6sm775112qtb.55.2022.01.25.11.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 11:11:53 -0800 (PST)
Message-ID: <7f6be58affaeac27bd3799134abe16ceba38c9a8.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Zhou Qingyang <zhou1615@umn.edu>
Date: Tue, 25 Jan 2022 14:11:51 -0500
In-Reply-To: <20220124165856.57022-1-zhou1615@umn.edu>
References: <20220124165856.57022-1-zhou1615@umn.edu>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau/acr: Fix undefined behavior in
 nvkm_acr_hsfw_load_bl()
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Tue, 2022-01-25 at 00:58 +0800, Zhou Qingyang wrote:
> In nvkm_acr_hsfw_load_bl(), the return value of kmalloc() is directly
> passed to memcpy(), which could lead to undefined behavior on failure
> of kmalloc().
> 
> Fix this bug by using kmemdup() instead of kmalloc()+memcpy().
> 
> This bug was found by a static analyzer.
> 
> Builds with 'make allyesconfig' show no new warnings,
> and our static analyzer no longer warns about this code.
> 
> Fixes: 22dcda45a3d1 ("drm/nouveau/acr: implement new subdev to replace
> "secure boot"")
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> ---
> The analysis employs differential checking to identify inconsistent 
> security operations (e.g., checks or kfrees) between two code paths 
> and confirms that the inconsistent operations are not recovered in the
> current function or the callers, so they constitute bugs. 
> 
> Note that, as a bug found by static analysis, it can be a false
> positive or hard to trigger. Multiple researchers have cross-reviewed
> the bug.
> 
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> index 667fa016496e..a6ea89a5d51a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> @@ -142,11 +142,12 @@ nvkm_acr_hsfw_load_bl(struct nvkm_acr *acr, const char
> *name, int ver,
>  
>         hsfw->imem_size = desc->code_size;
>         hsfw->imem_tag = desc->start_tag;
> -       hsfw->imem = kmalloc(desc->code_size, GFP_KERNEL);
> -       memcpy(hsfw->imem, data + desc->code_off, desc->code_size);
> -
> +       hsfw->imem = kmemdup(data + desc->code_off, desc->code_size,
> GFP_KERNEL);
>         nvkm_firmware_put(fw);
> -       return 0;
> +       if (!hsfw->imem)
> +               return -ENOMEM;
> +       else
> +               return 0;
>  }
>  
>  int

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

