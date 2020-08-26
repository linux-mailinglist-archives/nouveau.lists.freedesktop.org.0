Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8D62535E8
	for <lists+nouveau@lfdr.de>; Wed, 26 Aug 2020 19:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7F16E5A1;
	Wed, 26 Aug 2020 17:16:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F64E89F99
 for <nouveau@lists.freedesktop.org>; Wed, 26 Aug 2020 17:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598461978;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HNxk+EQ8wQ8tVIGqRrZql9fbdwG5Cj1VEgrvd+qiq60=;
 b=VxETYF1bzUuHL0PlEELRAI+LIen993dUoZDQ6lz+S9OH9vh8C8mCmg2Q6nJVwAEtzI587i
 mwrUhgmBbVM7QUAY7U3kffxojsMqmagainDY6jffE2huZbCKSif712A1SUohcGRVKKqOca
 NrrNGEfsFbBSr9VZM4ZkuMXgLLaBqOw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-QaBDYQlrPZyR908rQYp2tQ-1; Wed, 26 Aug 2020 13:12:55 -0400
X-MC-Unique: QaBDYQlrPZyR908rQYp2tQ-1
Received: by mail-qv1-f70.google.com with SMTP id d9so2082965qvl.10
 for <nouveau@lists.freedesktop.org>; Wed, 26 Aug 2020 10:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=HNxk+EQ8wQ8tVIGqRrZql9fbdwG5Cj1VEgrvd+qiq60=;
 b=T29k6xQuBQ8y8u29G+y1uYn8QhrRr+yVKKgtyEMeC8cHp5E30Y8MQ5sUyL/X/z/v9H
 qhB4CJTZueiphOtqf+CiyPa66EcTq/N/uQN3gm4Vrg5MvKkYW+JBQe/MmB/qrFeUIvFx
 rHnTNoPOBhrMDJY0/dVHoWF6lPkNOBfix4Jc1+WDeFvBiRHhwLJLGTL7yzpc/AWE4rc8
 WeP/8RuusVbw7ZqXpe9rD37khWeXTdNhMbZz9JuCY6CSLXsuQ3JDvi8K89bRyYN6SFTd
 R4ZGsj6qCF9hPrMp2R1/n3Gp6xGP9J2DZGNDS4Q3X0Z0mprUZlo1qbHHtM7b9tOtabJQ
 3A/A==
X-Gm-Message-State: AOAM531SgFV6QptbnU73RkGf/yWnLf5l/QCYfb74yB0jPiYEHIce2MD+
 MWVDtgyaZxGOyKPgJfYChYJy6Zo7/3lKec7cs58rX90g62wWhyw8/OW8clK2V7JWDSLJVDEzjnZ
 Mxah840SYptat2O317j4hvDQN9Q==
X-Received: by 2002:ac8:458a:: with SMTP id l10mr14982584qtn.345.1598461974855; 
 Wed, 26 Aug 2020 10:12:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPN0gfqk25wNBQ7pctyKxl91Z5N9+T1TGM7wzP+o65H/927i5DVjZXXu0XPikzyIsh50ev/w==
X-Received: by 2002:ac8:458a:: with SMTP id l10mr14982565qtn.345.1598461974593; 
 Wed, 26 Aug 2020 10:12:54 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id r73sm2063390qka.76.2020.08.26.10.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 10:12:54 -0700 (PDT)
Message-ID: <0b9fe80d058320b4e8e4fdf51a5445eddb1b0467.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
Date: Wed, 26 Aug 2020 13:12:52 -0400
In-Reply-To: <87o8mx6g6a.fsf@intel.com>
References: <20200825195027.74681-1-lyude@redhat.com>
 <20200825195027.74681-17-lyude@redhat.com> <87o8mx6g6a.fsf@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Wed, 26 Aug 2020 17:16:24 +0000
Subject: Re: [Nouveau] [RFC v4 16/20] drm/i915/dp: Extract
 drm_dp_get_sink_count()
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
Cc: David Airlie <airlied@linux.ie>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Imre Deak <imre.deak@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>,
 Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, 2020-08-26 at 10:05 +0300, Jani Nikula wrote:
> On Tue, 25 Aug 2020, Lyude Paul <lyude@redhat.com> wrote:
> > And of course, we'll also need to read the sink count from other drivers
> > as well if we're checking whether or not it's supported. So, let's
> > extract the code for this into another helper.
> > 
> > v2:
> > * Fix drm_dp_dpcd_readb() ret check
> > * Add back comment and move back sink_count assignment in
> > intel_dp_get_dpcd()
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Reviewed-by: Sean Paul <sean@poorly.run>
> > ---
> >  drivers/gpu/drm/drm_dp_helper.c         | 22 ++++++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_dp.c | 11 +++++------
> >  include/drm/drm_dp_helper.h             |  1 +
> >  3 files changed, 28 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_dp_helper.c
> > b/drivers/gpu/drm/drm_dp_helper.c
> > index 863e0babc1903..67ad05eb05b7e 100644
> > --- a/drivers/gpu/drm/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/drm_dp_helper.c
> > @@ -736,6 +736,28 @@ bool drm_dp_has_sink_count(struct drm_connector
> > *connector,
> >  }
> >  EXPORT_SYMBOL(drm_dp_has_sink_count);
> >  
> > +/**
> > + * drm_dp_get_sink_count() - Retrieve the sink count for a given sink
> 
> From the department of bikeshedding...
> 
> Should we have a naming scheme where it's obvious whether a function
> will do DPCD access, or just shuffle existing data?
> 
> For example, drm_dp_read_foo() for anything with DPCD access
> vs. drm_dp_get_foo() or even simpler for anything that only processes
> pre-read data?

Forgot to address this comment - yeah, I think that would be a good idea. I'll
go through my previous patches and make sure that they match this naming scheme
as well.
> 
> > + * @aux: The DP AUX channel to use
> > + *
> > + * Returns: The current sink count reported by @aux, or a negative error
> > code
> > + * otherwise.
> > + */
> > +int drm_dp_get_sink_count(struct drm_dp_aux *aux)
> > +{
> > +	u8 count;
> > +	int ret;
> > +
> > +	ret = drm_dp_dpcd_readb(aux, DP_SINK_COUNT, &count);
> > +	if (ret < 0)
> > +		return ret;
> > +	if (ret != 1)
> > +		return -EIO;
> 
> Makes me wonder if that shouldn't be at drm_dp_dpcd_read() level, for
> reads returning 0..len-1 bytes. Not necessarily part of this series, but
> seems silly to set a precedent to start handling that return value all
> over the place.
> 
> BR,
> Jani.
> 
> > +
> > +	return DP_GET_SINK_COUNT(count);
> > +}
> > +EXPORT_SYMBOL(drm_dp_get_sink_count);
> > +
> >  /*
> >   * I2C-over-AUX implementation
> >   */
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 35a4779a442e2..4337321a3be4f 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -4648,6 +4648,8 @@ intel_dp_has_sink_count(struct intel_dp *intel_dp)
> >  static bool
> >  intel_dp_get_dpcd(struct intel_dp *intel_dp)
> >  {
> > +	int ret;
> > +
> >  	if (!intel_dp_read_dpcd(intel_dp))
> >  		return false;
> >  
> > @@ -4664,11 +4666,8 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
> >  	}
> >  
> >  	if (intel_dp_has_sink_count(intel_dp)) {
> > -		u8 count;
> > -		ssize_t r;
> > -
> > -		r = drm_dp_dpcd_readb(&intel_dp->aux, DP_SINK_COUNT, &count);
> > -		if (r < 1)
> > +		ret = drm_dp_get_sink_count(&intel_dp->aux);
> > +		if (ret < 0)
> >  			return false;
> >  
> >  		/*
> > @@ -4676,7 +4675,7 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
> >  		 * a member variable in intel_dp will track any changes
> >  		 * between short pulse interrupts.
> >  		 */
> > -		intel_dp->sink_count = DP_GET_SINK_COUNT(count);
> > +		intel_dp->sink_count = ret;
> >  
> >  		/*
> >  		 * SINK_COUNT == 0 and DOWNSTREAM_PORT_PRESENT == 1 implies that
> > diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> > index a1413a531eaf4..0c141fc81aaa8 100644
> > --- a/include/drm/drm_dp_helper.h
> > +++ b/include/drm/drm_dp_helper.h
> > @@ -1635,6 +1635,7 @@ struct drm_dp_desc;
> >  bool drm_dp_has_sink_count(struct drm_connector *connector,
> >  			   const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> >  			   const struct drm_dp_desc *desc);
> > +int drm_dp_get_sink_count(struct drm_dp_aux *aux);
> >  
> >  void drm_dp_remote_aux_init(struct drm_dp_aux *aux);
> >  void drm_dp_aux_init(struct drm_dp_aux *aux);
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
