Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D5F24C2F0
	for <lists+nouveau@lfdr.de>; Thu, 20 Aug 2020 18:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB8A6E39C;
	Thu, 20 Aug 2020 16:07:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2EF6E39C
 for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2020 16:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597939672;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qJ60GW5I7GDTJbBQqWE3EmOtkI5NSzudyRlj9VDcORI=;
 b=irl+0Ae3e5VdH4D1MZqpxoKQjO1g5wfIdYglLn6YWlPRsTTZc1YLuggEdM8Z35VDBfdGVj
 5UtoOrKc0Bc7I0LU96Vt9MtBRR1LSMUYJyk3nHDFEF2nPqrENnBEUzutvIseY5QfqYZStB
 /HWQlNbfxyq0NClxAZSWwJgE3KEURo0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-chjhyw_hOCegVYnStPjA0g-1; Thu, 20 Aug 2020 12:07:48 -0400
X-MC-Unique: chjhyw_hOCegVYnStPjA0g-1
Received: by mail-qv1-f69.google.com with SMTP id d1so1668196qvs.21
 for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2020 09:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=qJ60GW5I7GDTJbBQqWE3EmOtkI5NSzudyRlj9VDcORI=;
 b=X87DbLTPAU5eVxtqU2tWfVPo378DachD9bv6MBUYU6WrJCW7ma+hIMboqRWQ4pKpap
 l/1sqaNuK5NVJp/0KoHAaPILE0KL4cebbTvrkDJrzeYYe3RJ7Nt25XsiGltYCgLh7M12
 sbLWMQVcfy+esqmDYEcQSmhvsytsB0uNEHRxsWNpVX3ghkjrHNeQxIolcDKiH9FReXrB
 kj2NkiJsPMpI+tZtfYhVHiAxDGmoHEbGJf+bmJd7iSvvHEHjQoq9LqxXcrQfEHaOmctO
 hVOPbOqYKWEkIuArzxOnElrUx+n1Kx9mLF9YU+c48KG0l8pE/eD7ZvGMWefpi5Lj2emv
 4NsQ==
X-Gm-Message-State: AOAM530Ggtk96b2fqfjM0mBOBcO0nGaJj6+ak+zhkRIcslFJiImGYxa1
 gzMBzAcckQaN6AaNRrdypPBj/yl2uOhRocHTMPmwVi00EhkLGxDiDpUvE1eMylKgwskWbIQIU6y
 IpL5t7BihB5o5zjH+PrtIua2lZg==
X-Received: by 2002:a05:6214:d46:: with SMTP id
 6mr3708556qvr.240.1597939667847; 
 Thu, 20 Aug 2020 09:07:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyO40CKZE46leN+nONQ3YVFgRPEtJrYd3+OHw2O70kDbwE+E1FviIHr4Wm0L0PBTbbLO5psCw==
X-Received: by 2002:a05:6214:d46:: with SMTP id
 6mr3708503qvr.240.1597939667342; 
 Thu, 20 Aug 2020 09:07:47 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id t8sm2599572qke.7.2020.08.20.09.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 09:07:46 -0700 (PDT)
Message-ID: <a8a6065678f7874abfde2a41ec891f31aa2a8e03.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Sean Paul <sean@poorly.run>
Date: Thu, 20 Aug 2020 12:07:44 -0400
In-Reply-To: <20200819152914.GE46474@art_vandelay>
References: <20200811200457.134743-1-lyude@redhat.com>
 <20200811200457.134743-20-lyude@redhat.com>
 <20200819152914.GE46474@art_vandelay>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [RFC 19/20] drm/i915/dp: Extract
 drm_dp_read_dpcd_caps()
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
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Animesh Manna <animesh.manna@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, 2020-08-19 at 11:29 -0400, Sean Paul wrote:
> On Tue, Aug 11, 2020 at 04:04:56PM -0400, Lyude Paul wrote:
> > Since DP 1.3, it's been possible for DP receivers to specify an
> > additional set of DPCD capabilities, which can take precedence over the
> > capabilities reported at DP_DPCD_REV.
> > 
> > Basically any device supporting DP is going to need to read these in an
> > identical manner, in particular nouveau, so let's go ahead and just move
> > this code out of i915 into a shared DRM DP helper that we can use in
> > other drivers.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > ---
> >  drivers/gpu/drm/drm_dp_helper.c             | 76 +++++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_dp.c     | 60 +---------------
> >  drivers/gpu/drm/i915/display/intel_dp.h     |  1 -
> >  drivers/gpu/drm/i915/display/intel_lspcon.c |  2 +-
> >  include/drm/drm_dp_helper.h                 |  3 +
> >  5 files changed, 82 insertions(+), 60 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_dp_helper.c
> > b/drivers/gpu/drm/drm_dp_helper.c
> > index 0ff2959c8f8e8..f9445915c6c26 100644
> > --- a/drivers/gpu/drm/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/drm_dp_helper.c
> > @@ -423,6 +423,82 @@ bool drm_dp_send_real_edid_checksum(struct drm_dp_aux
> > *aux,
> >  }
> >  EXPORT_SYMBOL(drm_dp_send_real_edid_checksum);
> >  
> > +static int drm_dp_read_extended_dpcd_caps(struct drm_dp_aux *aux,
> > +					  u8 dpcd[DP_RECEIVER_CAP_SIZE])
> > +{
> > +	u8 dpcd_ext[6];
> > +	int ret;
> > +
> > +	/*
> > +	 * Prior to DP1.3 the bit represented by
> > +	 * DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT was reserved.
> > +	 * If it is set DP_DPCD_REV at 0000h could be at a value less than
> > +	 * the true capability of the panel. The only way to check is to
> > +	 * then compare 0000h and 2200h.
> > +	 */
> > +	if (!(dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> > +	      DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT))
> > +		return 0;
> > +
> > +	ret = drm_dp_dpcd_read(aux, DP_DP13_DPCD_REV, &dpcd_ext,
> > +			       sizeof(dpcd_ext));
> > +	if (ret != sizeof(dpcd_ext))
> > +		return -EIO;
> > +
> > +	if (dpcd[DP_DPCD_REV] > dpcd_ext[DP_DPCD_REV]) {
> > +		DRM_DEBUG_KMS("%s: Extended DPCD rev less than base DPCD rev (%d
> > > %d)\n",
> > +			      aux->name, dpcd[DP_DPCD_REV],
> > +			      dpcd_ext[DP_DPCD_REV]);
> 
> Might be a good opportunity to convert all of these to drm_dbg_dp()?
> 
> > +		return 0;
> > +	}
> > +
> > +	if (!memcmp(dpcd, dpcd_ext, sizeof(dpcd_ext)))
> > +		return 0;
> > +
> > +	DRM_DEBUG_KMS("%s: Base DPCD: %*ph\n",
> > +		      aux->name, DP_RECEIVER_CAP_SIZE, dpcd);
> > +
> > +	memcpy(dpcd, dpcd_ext, sizeof(dpcd_ext));
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * drm_dp_read_dpcd_caps() - read DPCD caps and extended DPCD caps if
> > + * available
> > + * @aux: DisplayPort AUX channel
> > + * @dpcd: Buffer to store the resulting DPCD in
> > + *
> > + * Attempts to read the base DPCD caps for @aux. Additionally, this
> > function
> > + * checks for and reads the extended DPRX caps (%DP_DP13_DPCD_REV) if
> > + * present.
> > + *
> > + * Returns: %0 if the DPCD was read successfully, negative error code
> > + * otherwise.
> > + */
> > +int drm_dp_read_dpcd_caps(struct drm_dp_aux *aux,
> > +			  u8 dpcd[DP_RECEIVER_CAP_SIZE])
> > +{
> > +	int ret;
> > +
> > +	ret = drm_dp_dpcd_read(aux, DP_DPCD_REV, dpcd, DP_RECEIVER_CAP_SIZE);
> > +	if (ret != DP_RECEIVER_CAP_SIZE || dpcd[DP_DPCD_REV] == 0)
> > +		return -EIO;
> > +
> > +	ret = drm_dp_read_extended_dpcd_caps(aux, dpcd);
> > +	if (ret < 0)
> > +		return ret;
> 
> I wonder if we should just go with the "regular" dpcd caps we just read in
> this
> case?
FWIW - we generally want to just abort on failed DPCD reads since if a device
doesn't implement a feature like this, it'll usually read all zeroes. Failed
DPCD reads are almost always just the result of something suddenly being
disconnected (excluding some cases I've seen on MST, but I think those more have
to do with us sending incorrect dpcd read/write requests...)

> 
> Regardless of my nits,
> 
> Reviewed-by: Sean Paul <sean@poorly.run>
> 
> > +
> > +	DRM_DEBUG_KMS("%s: DPCD: %*ph\n",
> > +		      aux->name, DP_RECEIVER_CAP_SIZE, dpcd);
> > +
> > +	if (dpcd[DP_DPCD_REV] == 0)
> > +		ret = -EIO;
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL(drm_dp_read_dpcd_caps);
> > +
> >  /**
> >   * drm_dp_downstream_read_info() - read DPCD downstream port info if
> > available
> >   * @aux: DisplayPort AUX channel
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index e343965a483df..230aa0360dc61 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -4449,62 +4449,6 @@ intel_dp_link_down(struct intel_encoder *encoder,
> >  	}
> >  }
> >  
> > -static void
> > -intel_dp_extended_receiver_capabilities(struct intel_dp *intel_dp)
> > -{
> > -	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> > -	u8 dpcd_ext[6];
> > -
> > -	/*
> > -	 * Prior to DP1.3 the bit represented by
> > -	 * DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT was reserved.
> > -	 * if it is set DP_DPCD_REV at 0000h could be at a value less than
> > -	 * the true capability of the panel. The only way to check is to
> > -	 * then compare 0000h and 2200h.
> > -	 */
> > -	if (!(intel_dp->dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> > -	      DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT))
> > -		return;
> > -
> > -	if (drm_dp_dpcd_read(&intel_dp->aux, DP_DP13_DPCD_REV,
> > -			     &dpcd_ext, sizeof(dpcd_ext)) != sizeof(dpcd_ext)) {
> > -		drm_err(&i915->drm,
> > -			"DPCD failed read at extended capabilities\n");
> > -		return;
> > -	}
> > -
> > -	if (intel_dp->dpcd[DP_DPCD_REV] > dpcd_ext[DP_DPCD_REV]) {
> > -		drm_dbg_kms(&i915->drm,
> > -			    "DPCD extended DPCD rev less than base DPCD rev\n");
> > -		return;
> > -	}
> > -
> > -	if (!memcmp(intel_dp->dpcd, dpcd_ext, sizeof(dpcd_ext)))
> > -		return;
> > -
> > -	drm_dbg_kms(&i915->drm, "Base DPCD: %*ph\n",
> > -		    (int)sizeof(intel_dp->dpcd), intel_dp->dpcd);
> > -
> > -	memcpy(intel_dp->dpcd, dpcd_ext, sizeof(dpcd_ext));
> > -}
> > -
> > -bool
> > -intel_dp_read_dpcd(struct intel_dp *intel_dp)
> > -{
> > -	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> > -
> > -	if (drm_dp_dpcd_read(&intel_dp->aux, 0x000, intel_dp->dpcd,
> > -			     sizeof(intel_dp->dpcd)) < 0)
> > -		return false; /* aux transfer failed */
> > -
> > -	intel_dp_extended_receiver_capabilities(intel_dp);
> > -
> > -	drm_dbg_kms(&i915->drm, "DPCD: %*ph\n", (int)sizeof(intel_dp->dpcd),
> > -		    intel_dp->dpcd);
> > -
> > -	return intel_dp->dpcd[DP_DPCD_REV] != 0;
> > -}
> > -
> >  bool intel_dp_get_colorimetry_status(struct intel_dp *intel_dp)
> >  {
> >  	u8 dprx = 0;
> > @@ -4563,7 +4507,7 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
> >  	/* this function is meant to be called only once */
> >  	drm_WARN_ON(&dev_priv->drm, intel_dp->dpcd[DP_DPCD_REV] != 0);
> >  
> > -	if (!intel_dp_read_dpcd(intel_dp))
> > +	if (drm_dp_read_dpcd_caps(&intel_dp->aux, intel_dp->dpcd) != 0)
> >  		return false;
> >  
> >  	drm_dp_read_desc(&intel_dp->aux, &intel_dp->desc,
> > @@ -4650,7 +4594,7 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
> >  {
> >  	int ret;
> >  
> > -	if (!intel_dp_read_dpcd(intel_dp))
> > +	if (drm_dp_read_dpcd_caps(&intel_dp->aux, intel_dp->dpcd))
> >  		return false;
> >  
> >  	/*
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.h
> > b/drivers/gpu/drm/i915/display/intel_dp.h
> > index b901ab850cbd9..0a3af3410d52e 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.h
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> > @@ -99,7 +99,6 @@ bool intel_dp_source_supports_hbr3(struct intel_dp
> > *intel_dp);
> >  bool
> >  intel_dp_get_link_status(struct intel_dp *intel_dp, u8 *link_status);
> >  
> > -bool intel_dp_read_dpcd(struct intel_dp *intel_dp);
> >  bool intel_dp_get_colorimetry_status(struct intel_dp *intel_dp);
> >  int intel_dp_link_required(int pixel_clock, int bpp);
> >  int intel_dp_max_data_rate(int max_link_clock, int max_lanes);
> > diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c
> > b/drivers/gpu/drm/i915/display/intel_lspcon.c
> > index b781bf4696443..dc1b35559afdf 100644
> > --- a/drivers/gpu/drm/i915/display/intel_lspcon.c
> > +++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
> > @@ -571,7 +571,7 @@ bool lspcon_init(struct intel_digital_port *dig_port)
> >  		return false;
> >  	}
> >  
> > -	if (!intel_dp_read_dpcd(dp)) {
> > +	if (drm_dp_read_dpcd_caps(&dp->aux, dp->dpcd) != 0) {
> >  		DRM_ERROR("LSPCON DPCD read failed\n");
> >  		return false;
> >  	}
> > diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> > index 0c141fc81aaa8..11649e93e5bb6 100644
> > --- a/include/drm/drm_dp_helper.h
> > +++ b/include/drm/drm_dp_helper.h
> > @@ -1607,6 +1607,9 @@ static inline ssize_t drm_dp_dpcd_writeb(struct
> > drm_dp_aux *aux,
> >  	return drm_dp_dpcd_write(aux, offset, &value, 1);
> >  }
> >  
> > +int drm_dp_read_dpcd_caps(struct drm_dp_aux *aux,
> > +			  u8 dpcd[DP_RECEIVER_CAP_SIZE]);
> > +
> >  int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
> >  				 u8 status[DP_LINK_STATUS_SIZE]);
> >  
> > -- 
> > 2.26.2
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
