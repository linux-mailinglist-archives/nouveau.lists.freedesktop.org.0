Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5522744F53F
	for <lists+nouveau@lfdr.de>; Sat, 13 Nov 2021 21:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D5F6E1B6;
	Sat, 13 Nov 2021 20:22:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EDE6E0D7
 for <nouveau@lists.freedesktop.org>; Sat, 13 Nov 2021 20:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636834920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2F/RqjtwTDKHqbmFyTCtAaLezofMM+3SAjDwL4WYfjk=;
 b=ObfBA3ivQg63n7cg1OwWDy7Th7KAfdF7/jOJ+kxtSgvS4MwRL/RSpH44yq3hCvsOpNpch3
 9O81S2BDHCjyXyA9nilHx/0d1+WDqHu81U24GidkaCDD3c9gZ83aYei7+b92AYw1ftxUmc
 IPs83jIakZI//2jGk6GDgeU1XG4fhUw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-UT6IA_OGPziyAysx9FclsQ-1; Sat, 13 Nov 2021 15:21:59 -0500
X-MC-Unique: UT6IA_OGPziyAysx9FclsQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l6-20020a05600c4f0600b0033321934a39so6121828wmq.9
 for <nouveau@lists.freedesktop.org>; Sat, 13 Nov 2021 12:21:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2F/RqjtwTDKHqbmFyTCtAaLezofMM+3SAjDwL4WYfjk=;
 b=qfmem/1seJI2SqmR5eb8cNphmTyXWjsLTd7qoFBpp91zjgyNFNFWGKE/gimRkkWDLz
 78wtaQqLgFaWvAJ5ugRDFUTg2NoJ/JnYxoToI8wUNvBAJSKurpzBE08MSpEpUJewJDvA
 C1qRbz6ra0WraKbhv/XuUm2feUJwnclwa9OxZWbeIEsL0g4zL+Hg7xkn0jnjc9u9n239
 d/F4fQzXG/zf00UEP8PvyE0wP+RA0R/s/GVXnJ85jXnCD4HsU2nhKiDe3qHhk8VRo9FZ
 RmkuXrK1zsFB3XjF/XkFUHtBmnroucvSxu3O3hGrFpsfNc4evceD3yvMJaC38PQQYmbg
 WcWQ==
X-Gm-Message-State: AOAM530ZcnGb1JUXxAVBojFDDtY25zoN8pvvuHDB8msvIPM8U6HouCME
 d1YN/dzB00eeidHs0qbXECJo+XopeKVWBZLTtOI95UDmYHiSB5nSTTF9kdsLCJbu+1h0P01hayq
 R2ZF0j06ebc7HIYJKNz5XQMvoVMa8Cezhf29Ml/3SBw==
X-Received: by 2002:a5d:43c5:: with SMTP id v5mr31811219wrr.11.1636834918442; 
 Sat, 13 Nov 2021 12:21:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvqhfKWTCnwIY4T3+XKKRpmPT2+dOSNYismuaVwHbxo7aKrTV7NWW08xEzDGvONPamHxoBM3Hbj1P73gNHmAk=
X-Received: by 2002:a5d:43c5:: with SMTP id v5mr31811191wrr.11.1636834918255; 
 Sat, 13 Nov 2021 12:21:58 -0800 (PST)
MIME-Version: 1.0
References: <CABvMjLTVZaU8vMW__2BDo6FnjFa_bsh2S-kEmg=KV4KTsFiUzA@mail.gmail.com>
In-Reply-To: <CABvMjLTVZaU8vMW__2BDo6FnjFa_bsh2S-kEmg=KV4KTsFiUzA@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 13 Nov 2021 21:21:47 +0100
Message-ID: <CACO55tuDQ9UC2rr=_Hsowvujk49oNK1zWfHj3jMnhEqsTAnh0Q@mail.gmail.com>
To: Yizhuo Zhai <yzhai003@ucr.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] drm/nouveau/core: fix the uninitialized use
 in nvkm_ioctl_map()
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

something seems to have messed with the patch so it doesn't apply correctly.

On Thu, Jun 17, 2021 at 9:39 AM Yizhuo Zhai <yzhai003@ucr.edu> wrote:
>
> In function nvkm_ioctl_map(), the variable "type" could be
> uninitialized if "nvkm_object_map()" returns error code,
> however, it does not check the return value and directly
> use the "type" in the if statement, which is potentially
> unsafe.
>
> Signed-off-by: Yizhuo <yzhai003@ucr.edu>
> ---
>  drivers/gpu/drm/nouveau/nvkm/core/ioctl.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> index d777df5a64e6..7f2e8482f167 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> @@ -266,6 +266,8 @@ nvkm_ioctl_map(struct nvkm_client *client,
>                 ret = nvkm_object_map(object, data, size, &type,
>                                       &args->v0.handle,
>                                       &args->v0.length);
> +               if (ret)
> +                       return ret;
>                 if (type == NVKM_OBJECT_MAP_IO)
>                         args->v0.type = NVIF_IOCTL_MAP_V0_IO;
>                 else
> --
> 2.17.1
>

