Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C026E161E
	for <lists+nouveau@lfdr.de>; Thu, 13 Apr 2023 22:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC99110E0A1;
	Thu, 13 Apr 2023 20:50:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9F410E0AC
 for <nouveau@lists.freedesktop.org>; Thu, 13 Apr 2023 20:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681419046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eA15TxiCUZPdxrd+DAVR5aEn1HQmg1ANAGx56rle4iY=;
 b=US05DPnbmGTGMDo0hmQ+ik6OebdepAV6Ns2+EmnTzgAQEerg1cVGCW4AIQxaqpA6t5aE3J
 gdZFsIUK76ZV0y2f9yNZEN00SJOELZrWrtzv57HBzB8RdEF+4n8Wr9yHD2vi9q/LIyN5Ur
 wayghToERImYh+noM1xqcSt/mAOuBMY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-z2EgyU40MXaYFqHHH14pSA-1; Thu, 13 Apr 2023 16:50:45 -0400
X-MC-Unique: z2EgyU40MXaYFqHHH14pSA-1
Received: by mail-qv1-f70.google.com with SMTP id
 j4-20020a0cc344000000b005e94fb0d2b0so7959534qvi.4
 for <nouveau@lists.freedesktop.org>; Thu, 13 Apr 2023 13:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681419045; x=1684011045;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KmQxpMzSuEyk+3REh88Siq0gb5rqCSxABB+pkkoj8lI=;
 b=NzGzN0XayFlrS3KG2J4wYL+dBin9l9U+KQdGWB3bc55WtS0cEbi2Qz8Q1AdC4ruYZN
 BS33MFIifY3Udpl92ZCImwUIfKOlVDGUl6fYDH3LCCjXZBgarsyPC8+ViY+tXHV69plr
 OArXk9cIesgxAuaMq/1tHnQed41ME43gbLbL+QkzZLT1Po7P6fx1cYD/wHihmr3nv/S1
 0vIUGIQ4GHsUQctHy8AaSITUP3szQHEzgJlfpawDSBmjWrDDXwQD4CR70L7d5HoEgHMQ
 P4LNINM2dlladBtoyRbYbIy27Nbw/qzwZXIDAp1p41mb6bJZHz05uNWuCO+tLsiVPNP3
 j0dQ==
X-Gm-Message-State: AAQBX9evf9/BHQa496aX1XX7Th2FFWRADkC9rFz2GCPrie7hlGtg/x1j
 hN0QgnVIYrISCufx+v3jNHeXQLygDnaEY+Fs5OevB1JF3wW9pxZ9U5tKvnDSOphrD53q+4t9viy
 U0mVBqMAyeWPjq+FT6Ktp3txTrg==
X-Received: by 2002:a05:622a:178f:b0:3d2:7950:f790 with SMTP id
 s15-20020a05622a178f00b003d27950f790mr5567169qtk.62.1681419044917; 
 Thu, 13 Apr 2023 13:50:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350b12qT4nXWBVHubQJPdBC5iGLT75vNx2WB6Tcl30hDHb8I1dl6zwV8CoKpd3QHFzc9a8KqSHw==
X-Received: by 2002:a05:622a:178f:b0:3d2:7950:f790 with SMTP id
 s15-20020a05622a178f00b003d27950f790mr5567138qtk.62.1681419044690; 
 Thu, 13 Apr 2023 13:50:44 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c62:8200::feb? ([2600:4040:5c62:8200::feb])
 by smtp.gmail.com with ESMTPSA id
 a24-20020ac84358000000b003e64303bd2dsm739869qtn.63.2023.04.13.13.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 13:50:44 -0700 (PDT)
Message-ID: <61cccdbc80bfcaa2222c274e40c329ed84d41e55.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs
 <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Date: Thu, 13 Apr 2023 16:50:43 -0400
In-Reply-To: <20230407150031.79749-2-krzysztof.kozlowski@linaro.org>
References: <20230407150031.79749-1-krzysztof.kozlowski@linaro.org>
 <20230407150031.79749-2-krzysztof.kozlowski@linaro.org>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 2/2] drm/nouveau: constify pointers to
 hwmon_channel_info
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2023-04-07 at 17:00 +0200, Krzysztof Kozlowski wrote:
> Statically allocated array of pointed to hwmon_channel_info can be made
> const for safety.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---
>=20
> This depends on hwmon core patch:
> https://lore.kernel.org/all/20230406203103.3011503-2-krzysztof.kozlowski@=
linaro.org/
>=20
> Therefore I propose this should also go via hwmon tree.
>=20
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> ---
>  drivers/gpu/drm/nouveau/nouveau_hwmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/no=
uveau/nouveau_hwmon.c
> index e844be49e11e..db30a4c2cd4d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> @@ -211,7 +211,7 @@ static const struct attribute_group temp1_auto_point_=
sensor_group =3D {
> =20
>  #define N_ATTR_GROUPS   3
> =20
> -static const struct hwmon_channel_info *nouveau_info[] =3D {
> +static const struct hwmon_channel_info * const nouveau_info[] =3D {
>  =09HWMON_CHANNEL_INFO(chip,
>  =09=09=09   HWMON_C_UPDATE_INTERVAL),
>  =09HWMON_CHANNEL_INFO(temp,

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

