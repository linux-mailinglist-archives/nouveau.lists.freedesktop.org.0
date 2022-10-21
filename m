Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CC5607F4D
	for <lists+nouveau@lfdr.de>; Fri, 21 Oct 2022 21:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F4210E2F7;
	Fri, 21 Oct 2022 19:53:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517DE8825E
 for <nouveau@lists.freedesktop.org>; Fri, 21 Oct 2022 19:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666382003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QofnON1pIHgUL11O2ltSs3nNe2gK8qm53Je2KHvPKbo=;
 b=fawTw/TqHS9UVrsMT1SNy8XnlQvDNodu0HQ69tplbMHDnLXzT0uSEgm1jiL4G7C1d6Ydjv
 D0s9GWG2yIHSsjS50aHyW1b7GBkThzLvY2sNpOMizkrn8iJoKkDhC6Vxgbqu2/bNtGcW4q
 BCaUrMmVwEWpkX/SOngp7lAuvuwnwnw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-172-OAKvA6gIM5OVPXHu6qyVEQ-1; Fri, 21 Oct 2022 15:53:22 -0400
X-MC-Unique: OAKvA6gIM5OVPXHu6qyVEQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 h1-20020a0ceda1000000b004b899df67a4so2911039qvr.1
 for <nouveau@lists.freedesktop.org>; Fri, 21 Oct 2022 12:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QofnON1pIHgUL11O2ltSs3nNe2gK8qm53Je2KHvPKbo=;
 b=oFmRhDYUznpPeTZO1NoIHyQ/RnQgEzMMzbwjcGB4YmoxxuqBFdrxP4d7mBJM/sPe1x
 Sa4SwKLyI6/EKN5bOrfzo5crmq+lFjEDXOsL5f2fteSALpWgQgoRILRFeuu2LQ1UWfMx
 2VrVge0m/caX0BjZex2oyZ1UAjEMTVoNfnMGj4+q7RR1uxmkewvUbT9SuvaZeMwlVyva
 Uwe0oHKjyikL3bfNZQHRup86Auf3u5IEyyqnEuLoHNcW0XSE+qC8YatqpLtziV8CyobM
 C4DFOEdZRE211U0QDz7gLqZqdJ+vNgTbMrQ5c9xQK/3ftCfjUHYQKavXs3cB//jlf1D4
 OkXQ==
X-Gm-Message-State: ACrzQf0NPd3a++1nOpa1PcYjrVAAmHgQs1J/FAFcOYn02hwYDPi4Zf0b
 nmxZmDXOw1kXzagOL2FoKNwoD5LH1xuATCYohsyoveYR7WDbUDW+VcNIdq2NT7HR3F2mMO0R80Z
 p1Ao8TWQApXq5EuF6hstAtp09Yg==
X-Received: by 2002:a37:4454:0:b0:6e7:9bd0:bf53 with SMTP id
 r81-20020a374454000000b006e79bd0bf53mr15004520qka.616.1666382001733; 
 Fri, 21 Oct 2022 12:53:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6NdqiJx0bpBbrD3JAIB3bMvmM3hYKDj1n8vHRbhwtYdxet/rga1vQ0/yosOS0ci0f4jXcwdQ==
X-Received: by 2002:a37:4454:0:b0:6e7:9bd0:bf53 with SMTP id
 r81-20020a374454000000b006e79bd0bf53mr15004509qka.616.1666382001508; 
 Fri, 21 Oct 2022 12:53:21 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c68:4300::feb? ([2600:4040:5c68:4300::feb])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a05620a0c4a00b006bb2cd2f6d1sm10020328qki.127.2022.10.21.12.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 12:53:20 -0700 (PDT)
Message-ID: <bdaca873243ca55de9b286d732c46729f2d96415.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Alistair Popple <apopple@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 21 Oct 2022 15:53:19 -0400
In-Reply-To: <20221019122934.866205-1-apopple@nvidia.com>
References: <20221019122934.866205-1-apopple@nvidia.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH] nouveau: Fix migrate_to_ram() for faulting
 page
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
Cc: linux-mm@kvack.org, Ralph Campbell <rcampbell@nvidia.com>,
 nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, 2022-10-19 at 23:29 +1100, Alistair Popple wrote:
> Commit 16ce101db85d ("mm/memory.c: fix race when faulting a device private
> page") changed the migrate_to_ram() callback to take a reference on the
> device page to ensure it can't be freed while handling the fault.
> Unfortunately the corresponding update to Nouveau to accommodate this
> change was inadvertently dropped from that patch causing GPU to CPU
> migration to fail so add it here.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Fixes: 16ce101db85d ("mm/memory.c: fix race when faulting a device private page")
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Ralph Campbell <rcampbell@nvidia.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> 
> ---
> 
> Hi Andrew/Ben, apologies I must have accidentally dropped this small hunk
> when rebasing prior to sending v2 of the original series. Without this
> migration from GPU to CPU won't work in Nouveau so hopefully one of you can
> take this for v6.1-rcX. Thanks.

Hi!

Reviewed-by: Lyude Paul <lyude@redhat.com>

I will push this to drm-misc-next in just a moment, thanks for the patch!

> ---
>  drivers/gpu/drm/nouveau/nouveau_dmem.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 5fe209107246..20fe53815b20 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -176,6 +176,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
>  		.src		= &src,
>  		.dst		= &dst,
>  		.pgmap_owner	= drm->dev,
> +		.fault_page	= vmf->page,
>  		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
>  	};
>  

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

