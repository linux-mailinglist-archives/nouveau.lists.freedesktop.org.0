Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E378242BFF2
	for <lists+nouveau@lfdr.de>; Wed, 13 Oct 2021 14:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005216EA3F;
	Wed, 13 Oct 2021 12:27:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA246EA33
 for <nouveau@lists.freedesktop.org>; Wed, 13 Oct 2021 12:27:28 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id r18so7783498wrg.6
 for <nouveau@lists.freedesktop.org>; Wed, 13 Oct 2021 05:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=Z4fOeWoNGe7oIdEUiKQM52q9RkPtgbU73XW1me6uvfI=;
 b=cFlFkDQVisrjJ0gmIjial9F8G9xdYVR6VW7z23cXGkeQaIRZ7DDJCUozWDnHhwTgdq
 VaoSyyj+mBWC1vX1pq2dpOK57tJuyKAv4pECsQh2WDNu+KOxVjM/B4KL47tg+yIkME+S
 vX79oyE/SpY15pAPmYiHT3nvGZhTuPB+dMvq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=Z4fOeWoNGe7oIdEUiKQM52q9RkPtgbU73XW1me6uvfI=;
 b=ZSsAiMbTpMkdN6JCscgBMZspOKSQUpMul42onipjs9jBod604vqcjfCf3yIfkUBH84
 m8ISXpdCdZvAjCryZj61KihOzMTmIk7EunQCDldmhtpcfact7HPpL9wap5Lq6zvjDmiv
 LfoRCR4J1wjR50Tdscmg6U9q8Dg1Kn+zJrim7hogShqQzI8JRmj2X+VYGTbo1+fHBbAZ
 rE1JKMqOmSJ0hN6j8KnbTaKvO2wmQ7NnQHNbI+NIKy2+NphA13RHPrTPyX/haiXMhfAk
 XnjgKlTfIGcqPuo6fQcLQvlU9/YstlUuNeZjd0VHyM1vb89Mow0hM5KUwbTHHFNJD1Ch
 3kBg==
X-Gm-Message-State: AOAM531F0QH/mRRkJqfkm7b73ItTI7IdN7F7/8D3LP+OcPDSjc7QR++h
 0Cy11ZD9GdBCBHb+E63u1hBzVtFdvtPWfw==
X-Google-Smtp-Source: ABdhPJxLUAeVYVXqPDEDTDBfMn5AXMi7rqYAet0Wff3glrqg6tTfr+eDMzXKMGLBamxjUg3QJ4nQhQ==
X-Received: by 2002:adf:ae1a:: with SMTP id x26mr38590051wrc.30.1634128046809; 
 Wed, 13 Oct 2021 05:27:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e9sm5223682wme.37.2021.10.13.05.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 05:27:26 -0700 (PDT)
Date: Wed, 13 Oct 2021 14:27:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, Johannes Stezenbach <js@sig21.net>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org
Message-ID: <YWbQrP9blDndQV2F@phenom.ffwll.local>
Mail-Followup-To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, Johannes Stezenbach <js@sig21.net>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org
References: <20211008071708.1954041-1-javierm@redhat.com>
 <YWAlUBoMlerOGJEV@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YWAlUBoMlerOGJEV@intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Fri, Oct 08, 2021 at 02:02:40PM +0300, Ville Syrj�l� wrote:
> On Fri, Oct 08, 2021 at 09:17:08AM +0200, Javier Martinez Canillas wrote:
> > This reverts commit b3484d2b03e4c940a9598aa841a52d69729c582a.
> > 
> > That change attempted to improve the DRM drivers fbdev emulation device
> > names to avoid having confusing names like "simpledrmdrmfb" in /proc/fb.
> > 
> > But unfortunately there are user-space programs, such as pm-utils that
> > query that information and so broke after the mentioned commit. Since
> > the names in /proc/fb are used programs that consider it an ABI, let's
> > restore the old names even when this lead to silly naming like the one
> > mentioned above as an example.
> 
> The usage Johannes listed was this specificially:
>  using_kms() { grep -q -E '(nouveau|drm)fb' /proc/fb; }                                                        
> 
> So it actually looks like  Daniel's
> commit f243dd06180a ("drm/nouveau: Use drm_fb_helper_fill_info")
> also broke the abi. But for the pm-utils use case at least
> just having the "drmfb" in there should cover even nouveau.
> 
> Cc: stable@vger.kernel.org
> Reviewed-by: Ville Syrj�l� <ville.syrjala@linux.intel.com>
> 
> > 
> > Reported-by: Johannes Stezenbach <js@sig21.net>
> > Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> > ---
> > 
> >  drivers/gpu/drm/drm_fb_helper.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> > index 3ab07832104..8993b02e783 100644
> > --- a/drivers/gpu/drm/drm_fb_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > @@ -1737,7 +1737,7 @@ void drm_fb_helper_fill_info(struct fb_info *info,
> >  			       sizes->fb_width, sizes->fb_height);
> >  
> >  	info->par = fb_helper;
> > -	snprintf(info->fix.id, sizeof(info->fix.id), "%s",

Please add a comment here that drmfb is uapi because pm-utils matches
against it ...

Otherwise this will be lost in time again :-(
-Daniel
> > +	snprintf(info->fix.id, sizeof(info->fix.id), "%sdrmfb",
> >  		 fb_helper->dev->driver->name);
> >  
> >  }
> > -- 
> > 2.31.1
> 
> -- 
> Ville Syrj�l�
> Intel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
