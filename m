Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 398CD6264B9
	for <lists+nouveau@lfdr.de>; Fri, 11 Nov 2022 23:46:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DECD10E8EA;
	Fri, 11 Nov 2022 22:46:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6585910E8EA
 for <nouveau@lists.freedesktop.org>; Fri, 11 Nov 2022 22:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668206756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HfoD+yTsgDgyy3DKNtedBkMBeaq/mYuNaScJkhXJDcQ=;
 b=WfRGDPb65rye87R4KPsiuquAZw87lT2UwqlsNKWG8cZR8V8AsiMga7oXAnApxa+aX+BWag
 7SzMLiGrgqI+TCrpRpaIe5u7gPmMFLJzKWp/KAOVjJaEhUvCXzud5R2tI+MLxr1+oDV0vX
 jvd2675/R8uxVrEmEJmaXlvQYyWcdQ4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-487-kYKf3_T6OxC3iqysYsWL8Q-1; Fri, 11 Nov 2022 17:45:55 -0500
X-MC-Unique: kYKf3_T6OxC3iqysYsWL8Q-1
Received: by mail-qk1-f200.google.com with SMTP id
 br12-20020a05620a460c00b006fa52448320so5845348qkb.0
 for <nouveau@lists.freedesktop.org>; Fri, 11 Nov 2022 14:45:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HfoD+yTsgDgyy3DKNtedBkMBeaq/mYuNaScJkhXJDcQ=;
 b=nQ4kyAEOjj6dkaDFkskiPzE+GLJLcWol71S5fbACKeKuhoVAkQz3tTc2OAE5Po3+bE
 QjGq2Q7lUPu/ZIQOCmXKY6lB0hkWNSeJLn9tMqHvYg2bxCi1rm73OGVeaXx1C0yUdTT8
 RB4VSB38Gxv2BTvsFGIFCDAvXxD+xx/oZuMHD+ScXdURov2iG3AgXlLhdY11blvETfYW
 LmcpE884plLiL7iYKU1WVWHwZXP0Fz7FzzidAExpVFHMdnE7LWcvXOGM8cNkcWa3qLe1
 7IgcXGVXRbQdmrN1NfAksv/8/cM4HMSmTdzGZb5WF56nlOJwWQbrbslAywFbFqEN9Qk9
 8Z0g==
X-Gm-Message-State: ANoB5pnj6VuI3ca7mYtIM5UKzcwCXuKtGJJ2Q0M0gsdbyKNobnKSqMa6
 hwJ+ZS0xb8AoZDK63Iq9bxgahlXhKL1EeDkDQzM8Lk5ITOOGXsL/wq7/0G8tYxXA/M5mWJSVyX3
 Oi51QssuDsbL4noxzedO9qnjfVQ==
X-Received: by 2002:a37:6887:0:b0:6cd:fd44:d83e with SMTP id
 d129-20020a376887000000b006cdfd44d83emr2973930qkc.594.1668206755006; 
 Fri, 11 Nov 2022 14:45:55 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6SZGZhkL4AowLZ87AFimr5T3hQE6XB4d5J7ZosU46Koto1vL4Amhb0XNjGBjAqUUHeUBXwrQ==
X-Received: by 2002:a37:6887:0:b0:6cd:fd44:d83e with SMTP id
 d129-20020a376887000000b006cdfd44d83emr2973910qkc.594.1668206754748; 
 Fri, 11 Nov 2022 14:45:54 -0800 (PST)
Received: from ?IPv6:2600:4040:5c6c:9200::feb? ([2600:4040:5c6c:9200::feb])
 by smtp.gmail.com with ESMTPSA id
 f2-20020ac87f02000000b003a4c3c4d2d4sm1948861qtk.49.2022.11.11.14.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 14:45:53 -0800 (PST)
Message-ID: <023708836f1af8302c813e8308c7d406e6fd2310.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, bskeggs@redhat.com
Date: Fri, 11 Nov 2022 17:45:52 -0500
In-Reply-To: <20221111091130.57178-1-jiapeng.chong@linux.alibaba.com>
References: <20221111091130.57178-1-jiapeng.chong@linux.alibaba.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH 1/5] drm/nouveau/nvfw/acr: make
 wpr_generic_header_dump() static
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
Cc: nouveau@lists.freedesktop.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Actually hm, I think ben will need to consider pulling these into his branch
since these don't seem to apply to drm-misc-next - so presumably they're
related to some of the work that's been getting pushed recently for GSP prep

On Fri, 2022-11-11 at 17:11 +0800, Jiapeng Chong wrote:
> This symbol is not used outside of acr.c, so marks it static.
> 
> drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: warning: no previous prototype for ‘wpr_generic_header_dump’.
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3023
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c b/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
> index 83a9c48bc58c..7ac90c495737 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
> @@ -45,7 +45,7 @@ wpr_header_v1_dump(struct nvkm_subdev *subdev, const struct wpr_header_v1 *hdr)
>  	nvkm_debug(subdev, "\tstatus        : %d\n", hdr->status);
>  }
>  
> -void
> +static void
>  wpr_generic_header_dump(struct nvkm_subdev *subdev, const struct wpr_generic_header *hdr)
>  {
>  	nvkm_debug(subdev, "wprGenericHeader\n");

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

