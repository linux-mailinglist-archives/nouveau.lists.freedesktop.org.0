Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 904DE24A88F
	for <lists+nouveau@lfdr.de>; Wed, 19 Aug 2020 23:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD876E831;
	Wed, 19 Aug 2020 21:34:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C88A6E831
 for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2020 21:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597872874;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QBxDF3IUCX8aCR86kc12BR/uWRr4/k3zDVFWtKdcER0=;
 b=ERkuoRdn5Q8Y7WXgSaBhutyen/ij9jxvj8k7Pka/uWAbGyN/UVeynFgWeBxpYsMrWsRXIY
 R0Wp7+PSYXi8k8M39D67g02tlvOTlSnXxyCtX4Pmu5YVJjwXe8bOv5+1520gj4jLOUGq3P
 ctBRNgXl82qk+0jbRGren/YWVHwwNrc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-OnrZvH1wMjKW8ig8WCSSUg-1; Wed, 19 Aug 2020 17:34:19 -0400
X-MC-Unique: OnrZvH1wMjKW8ig8WCSSUg-1
Received: by mail-qv1-f71.google.com with SMTP id i4so16588437qvv.4
 for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2020 14:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=QBxDF3IUCX8aCR86kc12BR/uWRr4/k3zDVFWtKdcER0=;
 b=YFymYs4IA9JAIj1uZin5t2JZA/o11BRJ8wACc4I+CfWIJMUbm2cWOjgS98DOSPKLDG
 71cdfjSzEVO1/c2mGcGlprBDgebSRCHcqTWmnmEsV7MpDwT6Csz+gUVMRezy/ES2C+LP
 BUXuMk5PdtM/7IcKQjG1XNU0AehZt176L/ErO53BEb2eZu021okjg3papZsAfbH436o1
 GbVtqewbkfVVMJK6tTd028p0TQ8Oq00ed8N1II3CvA78T2uiKDcGTkqYMUZ3oxIED/mB
 NxAxSb/HVzb34CB/nt4UFfO0nWgx9w6P7l/qaPdcyR/8bCIVSKMqVvPzwtYkeNQuVXR7
 oPtA==
X-Gm-Message-State: AOAM533jcnuipUTwDFkfKfWuwYTmjajqFYBSHl65NJ11u1wTOq+mr5b6
 vusQ5nIg5W2YifGoZXImxWepRBipMk8AlM3DnQYAOkOGRS7NQlulpcl8sYs7Y083S5Ui50Mk2ch
 9CXJD9ztAuhXx3bE7hOEnjsow+g==
X-Received: by 2002:a05:620a:1212:: with SMTP id
 u18mr22699599qkj.319.1597872858638; 
 Wed, 19 Aug 2020 14:34:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVNlhQ7amNmrTxK+EbgJ0YtfuKpPQ6pWpdz180NyjwAbWnqYVsy94Wd4ejd2YTxpnp8aar8g==
X-Received: by 2002:a05:620a:1212:: with SMTP id
 u18mr22699572qkj.319.1597872858224; 
 Wed, 19 Aug 2020 14:34:18 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id l189sm25736302qke.67.2020.08.19.14.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 14:34:17 -0700 (PDT)
Message-ID: <4d74a74aefcd8d0ea048b70252efda18820bc911.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Sean Paul <sean@poorly.run>, Ville Syrjala
 <ville.syrjala@linux.intel.com>,  Imre Deak <imre.deak@intel.com>
Date: Wed, 19 Aug 2020 17:34:15 -0400
In-Reply-To: <20200819151547.GB46474@art_vandelay>
References: <20200811200457.134743-1-lyude@redhat.com>
 <20200811200457.134743-14-lyude@redhat.com>
 <20200819151547.GB46474@art_vandelay>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [RFC 13/20] drm/i915/dp: Extract
 drm_dp_downstream_read_info()
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

(adding Ville and Imre to the cc here, they might be interested to know about
this, comments down below)

On Wed, 2020-08-19 at 11:15 -0400, Sean Paul wrote:
> On Tue, Aug 11, 2020 at 04:04:50PM -0400, Lyude Paul wrote:
> > We're going to be doing the same probing process in nouveau for
> > determining downstream DP port capabilities, so let's deduplicate the
> > work by moving i915's code for handling this into a shared helper:
> > drm_dp_downstream_read_info().
> > 
> > Note that when we do this, we also do make some functional changes while
> > we're at it:
> > * We always clear the downstream port info before trying to read it,
> >   just to make things easier for the caller
> > * We skip reading downstream port info if the DPCD indicates that we
> >   don't support downstream port info
> > * We only read as many bytes as needed for the reported number of
> >   downstream ports, no sense in reading the whole thing every time
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > ---
> >  drivers/gpu/drm/drm_dp_helper.c         | 32 +++++++++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_dp.c | 14 ++---------
> >  include/drm/drm_dp_helper.h             |  3 +++
> >  3 files changed, 37 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_dp_helper.c
> > b/drivers/gpu/drm/drm_dp_helper.c
> > index 4c21cf69dad5a..9703b33599c3b 100644
> > --- a/drivers/gpu/drm/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/drm_dp_helper.c
> > @@ -423,6 +423,38 @@ bool drm_dp_send_real_edid_checksum(struct drm_dp_aux
> > *aux,
> >  }
> >  EXPORT_SYMBOL(drm_dp_send_real_edid_checksum);
> >  
> > +/**
> > + * drm_dp_downstream_read_info() - read DPCD downstream port info if
> > available
> > + * @aux: DisplayPort AUX channel
> > + * @dpcd: A cached copy of the port's DPCD
> > + * @downstream_ports: buffer to store the downstream port info in
> > + *
> > + * Returns: 0 if either the downstream port info was read successfully or
> > + * there was no downstream info to read, or a negative error code
> > otherwise.
> > + */
> > +int drm_dp_downstream_read_info(struct drm_dp_aux *aux,
> > +				const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> > +				u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS])
> > +{
> > +	int ret;
> > +	u8 len;
> > +
> > +	memset(downstream_ports, 0, DP_MAX_DOWNSTREAM_PORTS);
> > +
> > +	/* No downstream info to read */
> > +	if (!drm_dp_is_branch(dpcd) ||
> > +	    dpcd[DP_DPCD_REV] < DP_DPCD_REV_10 ||
> > +	    !(dpcd[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_PRESENT))
> > +		return 0;
> > +
> > +	len = (dpcd[DP_DOWN_STREAM_PORT_COUNT] & DP_PORT_COUNT_MASK) * 4;
> 
> I'm having a hard time rationalizing DP_MAX_DOWNSTREAM_PORTS being 16, but
> only
> having 4 ports worth of data in the DP_DOWNSTREAM_PORT_* registers. Do you
> know
> what's supposed to happen if dpcd[DP_DOWN_STREAM_PORT_COUNT] is > 4?
> 
ok!! Taking a lesson from our available_pbn/full_pbn confusion in the past, I
squinted very hard at the specification and eventually found something that I
think clears this up. Surprise - we definitely had this implemented incorrectly
in i915

From section 5.3.3.1:

   Either one or four bytes are used, per DFP type indication. Therefore, up to
   16 (with 1-byte descriptor) or four (with 4-byte descriptor) DFP capabilities
   can be stored.

So, a couple takeaways from this:

 * A DisplayPort connector can have *multiple* different downstream port types,
   which I think actually makes sense as I've seen an adapter like this before.
 * We actually added the ability to determine the downstream port type for DP
   connectors using the subconnector prop, but it seems like if we want to aim
   for completeness we're going to need to come up with a new prop that can
   report multiple downstream port types :\.
 * It's not explicitly mentioned, but I'm assuming the correct way of handling
   multiple downstream BPC/pixel clock capabilities is to assume the max
   BPC/pixel clock is derived from the lowest max BPC/pixel clock we find on
   *connected* downstream ports (anything else wouldn't really make sense, imho)

So I'm going to rewrite this so we handle this properly in
drm_dp_downstream_read_info() and related helpers. I don't currently have the
time to do this, but if there's interest upstream in properly reporting the
downstream port types of DP ports in userspace someone might want to consider
coming up with another prop that accounts for multiple different downstream port
types.

> Sean
> 
> > +	ret = drm_dp_dpcd_read(aux, DP_DOWNSTREAM_PORT_0, downstream_ports,
> > +			       len);
> > +
> > +	return ret == len ? 0 : -EIO;
> > +}
> > +EXPORT_SYMBOL(drm_dp_downstream_read_info);
> > +
> >  /**
> >   * drm_dp_downstream_max_clock() - extract branch device max
> >   *                                 pixel rate for legacy VGA
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 1e29d3a012856..984e49194ca31 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -4685,18 +4685,8 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
> >  			return false;
> >  	}
> >  
> > -	if (!drm_dp_is_branch(intel_dp->dpcd))
> > -		return true; /* native DP sink */
> > -
> > -	if (intel_dp->dpcd[DP_DPCD_REV] == 0x10)
> > -		return true; /* no per-port downstream info */
> > -
> > -	if (drm_dp_dpcd_read(&intel_dp->aux, DP_DOWNSTREAM_PORT_0,
> > -			     intel_dp->downstream_ports,
> > -			     DP_MAX_DOWNSTREAM_PORTS) < 0)
> > -		return false; /* downstream port status fetch failed */
> > -
> > -	return true;
> > +	return drm_dp_downstream_read_info(&intel_dp->aux, intel_dp->dpcd,
> > +					   intel_dp->downstream_ports) == 0;
> >  }
> >  
> >  static bool
> > diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> > index 5c28199248626..1349f16564ace 100644
> > --- a/include/drm/drm_dp_helper.h
> > +++ b/include/drm/drm_dp_helper.h
> > @@ -1613,6 +1613,9 @@ int drm_dp_dpcd_read_link_status(struct drm_dp_aux
> > *aux,
> >  bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
> >  				    u8 real_edid_checksum);
> >  
> > +int drm_dp_downstream_read_info(struct drm_dp_aux *aux,
> > +				const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> > +				u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS]);
> >  int drm_dp_downstream_max_clock(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> >  				const u8 port_cap[4]);
> >  int drm_dp_downstream_max_bpc(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
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
