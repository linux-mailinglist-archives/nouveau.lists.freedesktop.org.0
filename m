Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A45D4232A7
	for <lists+nouveau@lfdr.de>; Tue,  5 Oct 2021 23:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB126EC59;
	Tue,  5 Oct 2021 21:05:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9BE6EC59
 for <nouveau@lists.freedesktop.org>; Tue,  5 Oct 2021 21:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633467941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lfl0QljxqRN6yI8SUHIl8xNQ8TUgxD9hmUMeCkJYtjg=;
 b=Ct5i1BRq9hkEDZphaUtDw8jXCILqHG9VkZwwBekUNixymoOc67rglRoxxuhYpRWUUpiW6d
 M8eeSWkWMGp3VNRhuuA6fK+A0OcjI8NVr044X+5a+yC6b9OeUZmszSGkZGn/Gn4awcKUpf
 h0pYJuLIIpGLMmSE2GtcRqMlHP7xqe0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-lyZKzH6OM2uIYSAJ_lPiqw-1; Tue, 05 Oct 2021 17:05:28 -0400
X-MC-Unique: lyZKzH6OM2uIYSAJ_lPiqw-1
Received: by mail-wr1-f69.google.com with SMTP id
 e12-20020a056000178c00b001606927de88so311378wrg.10
 for <nouveau@lists.freedesktop.org>; Tue, 05 Oct 2021 14:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lfl0QljxqRN6yI8SUHIl8xNQ8TUgxD9hmUMeCkJYtjg=;
 b=Sczgkr4f+WAMhx++868b55qHvo21itRvHnzKPrDpXlQgj2dyxvFqiryn3nqwXrlCke
 U2l8SbuOzGQGMYH/9NJ+vcgpRDOgd52l2BI5WNMSq3jxgUbZu7QH2Hidwbx8ltTKGiUl
 DLiTVoh0rgJyWgYNcyQY2Bx7xnSdmQjNxZvZPHmn+rrp2J5Nz2F3J0vYX4wW1MdDFfru
 9ml37Ox+FJLSwAv0uCpv/2uTXd/1tpSt2xNuVAXre9KGcbuAMEiAA3x2sdw0HjsiuyN6
 cLOhlTotnJdKjWPd6rMsCoaHtnuTqtmNsG/fNVFzmJ6cg75aUcxMp9NXCg1mthaWE3ce
 TOjw==
X-Gm-Message-State: AOAM530ZkfopBMs8B52DW8DRjzghdvgkKml2BW2GsxxAduad4LKnBWGS
 NwArNv8+IXpJa5likF6BCa38PWId6fbdtD40okSRnvP/g16ID3brrn8/qc3yTXnfWu0jmJIgud0
 vSfBIpOqFPZ0/Pap9TPKgMohnXbu5xskk4QzhuAixlw==
X-Received: by 2002:adf:a48e:: with SMTP id g14mr20425029wrb.11.1633467927806; 
 Tue, 05 Oct 2021 14:05:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiloegc3LkQgPGDy2mGV9rNwvfCW4BBiNUOpQ5JaCgezh9eZPz8MNKKjRvqx+jq/zeUAXhbeGE8En37pMb/tg=
X-Received: by 2002:adf:a48e:: with SMTP id g14mr20425022wrb.11.1633467927644; 
 Tue, 05 Oct 2021 14:05:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210401141731.1684236-1-yangyingliang@huawei.com>
In-Reply-To: <20210401141731.1684236-1-yangyingliang@huawei.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 5 Oct 2021 23:05:16 +0200
Message-ID: <CACO55ttptSsD05p5b8GWnBfjSoN-QK6N5urR-JUthqWeiprB8A@mail.gmail.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH -next] drm/nouveau/gem: remove redundant
 semi-colon
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

sorry for the late response though.

On Fri, Apr 2, 2021 at 12:28 AM Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index c88cbb85f101..492e6794c5e6 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -303,7 +303,7 @@ nouveau_gem_set_domain(struct drm_gem_object *gem, uint32_t read_domains,
>         struct ttm_buffer_object *bo = &nvbo->bo;
>         uint32_t domains = valid_domains & nvbo->valid_domains &
>                 (write_domains ? write_domains : read_domains);
> -       uint32_t pref_domains = 0;;
> +       uint32_t pref_domains = 0;
>
>         if (!domains)
>                 return -EINVAL;
> --
> 2.25.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

