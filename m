Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7946B1ED44D
	for <lists+nouveau@lfdr.de>; Wed,  3 Jun 2020 18:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E179689D4F;
	Wed,  3 Jun 2020 16:26:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3036489D4F
 for <nouveau@lists.freedesktop.org>; Wed,  3 Jun 2020 16:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591201581;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dMqwWWzHo3fy38RH5JowEjmFezZIYfiA+LiXUUe2ODM=;
 b=Qe6Ovc1PowuKBQOam5UhE01waMp9RWOemxB30fPGTr/F2lxfv6V9PlHVNf5B5tABriBA25
 H1rdLIWXBtn+dSmawidQsTLJ6z/88jhdJ5u+WEbbpGQlaccs7adiZTjKQjhyTcXJGusEue
 pHZOYRasU9wuW+RO/VyI3egiziiPdZk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-3OtowtHSNlSn7nFMe0rRhg-1; Wed, 03 Jun 2020 12:26:16 -0400
X-MC-Unique: 3OtowtHSNlSn7nFMe0rRhg-1
Received: by mail-qt1-f199.google.com with SMTP id q21so2311124qtn.20
 for <nouveau@lists.freedesktop.org>; Wed, 03 Jun 2020 09:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=dMqwWWzHo3fy38RH5JowEjmFezZIYfiA+LiXUUe2ODM=;
 b=HMXVIUuZCivaDy97oRQAFsydJudEt+Ze29YaKXevf/Jj345Qnxfpf3cJ46TOBi6XCq
 U71DlxLg488i3T4jZSXZgAxldMb0jhPfAOzUbm9DNTl6s78dcG8c5X8WJRXpWlMgXmJe
 cGube8SmkfEVfKZeYoTEXXyvvZwHFhVRu+tNre3m5vl6CAw4si//1n7dKoNogulB1YOi
 2HEupPRs43LKe3uSbdb3nRtarZj835UUr1UOR0JzUYXzgz3BRfkVR8OZaRV3n1tAQrp5
 4sMcDP/1QLJH4GFf1hpM+Ik77O274zpoRvsrCl8JbwE5uOj1Ee1ZYY9KwDjsdDt0mjv3
 XP1w==
X-Gm-Message-State: AOAM533inoCLu0iPmfw1lNojv0Mc+bA0XPHAtSrFIkA9PoXX+5dpEvCB
 Y6uZ8JmYKRRpRW0ww1dOKLPze+nIRIl9abi2wt/rBYpKsn/JkhgJSbNbMxNpTVgfKFH8JpGLA3y
 Nma4sIEcwP4ND7OtNrKndqXD+eA==
X-Received: by 2002:a37:8302:: with SMTP id f2mr459423qkd.220.1591201576108;
 Wed, 03 Jun 2020 09:26:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKqhMLHPZcgjFr9XB7c/kNuGHGvZZ0lp+ttkkbotvsK/G4TlijsRIMnW9BziRubgOsnvwXrQ==
X-Received: by 2002:a37:8302:: with SMTP id f2mr459396qkd.220.1591201575825;
 Wed, 03 Jun 2020 09:26:15 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (static-173-76-190-23.bstnma.ftas.verizon.net. [173.76.190.23])
 by smtp.gmail.com with ESMTPSA id a38sm2632175qtb.37.2020.06.03.09.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 09:26:15 -0700 (PDT)
Message-ID: <4c6a9fba546fc9a8c63d9669cfd4876efc903786.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
Date: Wed, 03 Jun 2020 12:26:14 -0400
In-Reply-To: <20200520104750.21335-1-dinghao.liu@zju.edu.cn>
References: <20200520104750.21335-1-dinghao.liu@zju.edu.cn>
Organization: Red Hat
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] drm/nouveau/dispnv50: fix runtime pm
 imbalance on error
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
Reply-To: lyude@redhat.com
Cc: David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.de>, Sean Paul <seanpaul@chromium.org>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 nouveau@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi! Was going through my email and found this from last month, it's a bit late
and someone might have reviewed/pushed this already but just in case:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Wed, 2020-05-20 at 18:47 +0800, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> the call returns an error code. Thus a pairing decrement is needed
> on the error handling path to keep the counter balanced.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 6be9df1820c5..e670756664ff 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1123,8 +1123,10 @@ nv50_mstc_detect(struct drm_connector *connector,
>  		return connector_status_disconnected;
>  
>  	ret = pm_runtime_get_sync(connector->dev->dev);
> -	if (ret < 0 && ret != -EACCES)
> +	if (ret < 0 && ret != -EACCES) {
> +		pm_runtime_put_autosuspend(connector->dev->dev);
>  		return connector_status_disconnected;
> +	}
>  
>  	ret = drm_dp_mst_detect_port(connector, ctx, mstc->port->mgr,
>  				     mstc->port);

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
