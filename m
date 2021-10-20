Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6819043664B
	for <lists+nouveau@lfdr.de>; Thu, 21 Oct 2021 17:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529056ECBA;
	Thu, 21 Oct 2021 15:31:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B786E0D5
 for <nouveau@lists.freedesktop.org>; Wed, 20 Oct 2021 16:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634748025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=StojfAqyeQHDkij+8rTrbPKJcvcUj0fGJk9VVUumXz4=;
 b=OOhs+PFs/yKvdKoKa2GjC/Qv1zHpOCF8kZwP9g7DSsJCYUzHLdcVQ1mdZ9cfTnn85gOWSo
 /zIgWHLMvpbqAzy22eqndaDLJHmSE22ymEJWp4Vq9MgCQGm6jS/Rdy6p6V8UwFw3SraTUf
 FGMZWKwlqqJy8SCWmeJBUwSyLcEj59c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-oI-kjuw0ME6z1QVXqbcM-g-1; Wed, 20 Oct 2021 12:40:19 -0400
X-MC-Unique: oI-kjuw0ME6z1QVXqbcM-g-1
Received: by mail-wr1-f70.google.com with SMTP id
 r21-20020adfa155000000b001608162e16dso10203408wrr.15
 for <nouveau@lists.freedesktop.org>; Wed, 20 Oct 2021 09:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=StojfAqyeQHDkij+8rTrbPKJcvcUj0fGJk9VVUumXz4=;
 b=nOWrp83IJRH7j3Uc8qHxqEF1N1CZPNGUjymiTQioDqmD3Zwdt7Fj3Gd9O/bja2OfGA
 Q8nIn7Lh3NPfQyvBOhSviF3KrH2aNdujxHbhtYbILKP/xR2ff9O3k0q3AQ1Ek12+nYBc
 PcPNYLAlDytukxvU2WkM1Vp/GaNylFPyZiczIOS8VBS4Y5YKc1xyrbOaN2A4cWPMDbHC
 Q9lheoeZS+o7NIYGe9OIFMcgVeP+W0cjg57xCIcpnUb0IE/yCZNihG270eXu0OIMdPxc
 2/RKyDs/DFSk0HWc0TQ4buxiF6FjftfcQCv6/On3FVx3gl9293ZSKqLAKEXXBbn8Xs70
 Gd5w==
X-Gm-Message-State: AOAM533F8CVQJozjWdxxv0Kbo3DWtkHuUrUed6ojqqDvkMrRcJH4QJ0p
 4HpvqVazuW9VYePveWI/gl50C3g62MITBth2aMmjo6MWh40nHhOJPjk1S+CUzpMJMn9BIkjpvvf
 8OpLhT1DWZ2Odt5nFGJd8wTQZmQ==
X-Received: by 2002:adf:e382:: with SMTP id e2mr421216wrm.90.1634748018445;
 Wed, 20 Oct 2021 09:40:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4j+FN8dHBAspNShPIfXEQEdqjV+D4OWwFaz88jZoJj1s/iEEzhN8nZO5xV9XP0HqGJTMqgA==
X-Received: by 2002:adf:e382:: with SMTP id e2mr421162wrm.90.1634748018118;
 Wed, 20 Oct 2021 09:40:18 -0700 (PDT)
Received: from [192.168.1.128] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id g2sm2413587wrq.62.2021.10.20.09.40.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 09:40:17 -0700 (PDT)
Message-ID: <9989e16f-38a0-c76b-0408-d47f120eec7f@redhat.com>
Date: Wed, 20 Oct 2021 18:40:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 linux-kernel@vger.kernel.org, Johannes Stezenbach <js@sig21.net>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org
References: <20211008071708.1954041-1-javierm@redhat.com>
 <YWAlUBoMlerOGJEV@intel.com> <YWbQrP9blDndQV2F@phenom.ffwll.local>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YWbQrP9blDndQV2F@phenom.ffwll.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 21 Oct 2021 15:31:16 +0000
Subject: Re: [Nouveau] [PATCH] Revert "drm/fb-helper: improve DRM fbdev
 emulation device names"
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

Hello Daniel,

On 10/13/21 14:27, Daniel Vetter wrote:
>>>  
>>>  	info->par = fb_helper;
>>> -	snprintf(info->fix.id, sizeof(info->fix.id), "%s",
> 
> Please add a comment here that drmfb is uapi because pm-utils matches
> against it ...
> 

Sure, I'll do that and send a v2.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

