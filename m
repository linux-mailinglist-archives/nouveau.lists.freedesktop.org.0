Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D44C249006
	for <lists+nouveau@lfdr.de>; Tue, 18 Aug 2020 23:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3436E15D;
	Tue, 18 Aug 2020 21:18:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 1030 seconds by postgrey-1.36 at gabe;
 Tue, 18 Aug 2020 21:18:35 UTC
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34BA6E15D
 for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2020 21:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597785515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qdpi3lZBzMRbaRcRSQST+wrUj5vZ5zL3ENbSk6UWLNQ=;
 b=M79BndGDDeUQopM1u1ajbIh+HF3qahYELNL8HJUt8rB+oZswwNSCc8HRWYdcd2A1qQlkor
 3OUznSrw8iYIKAqE1nu2MJ3NCWLIL+6s9bxe/9uGDDKOhwfj2g3bj9/4pLo/JUM846TuLk
 VM/Sxk6kcS/LAHkAPDm7HFoLs89TwsY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-KFUakB9WMe2oaydd8FlbrA-1; Tue, 18 Aug 2020 17:18:30 -0400
X-MC-Unique: KFUakB9WMe2oaydd8FlbrA-1
Received: by mail-qk1-f198.google.com with SMTP id k142so14032895qke.7
 for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2020 14:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qdpi3lZBzMRbaRcRSQST+wrUj5vZ5zL3ENbSk6UWLNQ=;
 b=I6RJr0YAbPt5jAGCb/HkKYYbbJAJXDAN7ZrmWiylDyttKkxP532MM0Lwm/U0ZinkOH
 ljft3VVlIWzpyRSLN0NY7U5goNi0qeKn35HHIt7eMgvjmiZh/MMGckYGPQlnQLdKJQAU
 qlLxjs71zRZFhbkc0g8meiPUiOAvsPMla/E7yROBBbXHklYQ+6KRJNk0MAsiGicfsQSV
 hN9NoVbhTaDfUtpPdv+oP2TM15lE0goQeeTwhGOEXHfPUI2jToRYJ1/4MFt/ObGEhQG8
 ytR58Jw+Cb4fhF8HEoACeQ0KyY1cYMSCOOOZcwwSYNRJKLnbUGP/dNHi6AwtDgggLR0x
 qhtA==
X-Gm-Message-State: AOAM531EvBKfmXFyoF7E/EJDJYLUlFy0gY9LgnR9WiTbtdiDArrpdg71
 BTfUpbfdaiC5kdiPUO++zZa0cDptwfXK6tr/199oz9+pQZotIp+vveL+YmcAiVb7H1gP4QnqMUX
 xpideSFg8hPmGb916mhWsXwq47w==
X-Received: by 2002:a05:6214:1351:: with SMTP id
 b17mr20689074qvw.98.1597785510036; 
 Tue, 18 Aug 2020 14:18:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrjL4v2fPDTbU70DMYpldtWfJ4gHWK3UaJjVX8Jm/AUVXhESVsKUr5TxPG2Y0VOJ3LZs3YSQ==
X-Received: by 2002:a05:6214:1351:: with SMTP id
 b17mr20689063qvw.98.1597785509793; 
 Tue, 18 Aug 2020 14:18:29 -0700 (PDT)
Received: from dev.jcline.org ([136.56.87.133])
 by smtp.gmail.com with ESMTPSA id s5sm22601806qke.120.2020.08.18.14.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 14:18:28 -0700 (PDT)
Date: Tue, 18 Aug 2020 17:18:27 -0400
From: Jeremy Cline <jcline@redhat.com>
To: Lyude <lyude@redhat.com>
Message-ID: <20200818211827.GB53828@dev.jcline.org>
References: <20200417211025.109574-5-lyude@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200417211025.109574-5-lyude@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Subject: Re: [Nouveau] [i-g-t, v3,
 4/5] lib/igt_kms: Hook up connector dithering prop
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
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

On Fri, Apr 17, 2020 at 05:10:24PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> Nvidia display hardware provides a set of flexible dithering options for
> CRTCs. This dithering is actually noticeable in the CRC output for all
> available tap points, and can be seen as CRC values for identical frames
> cycling between either 2 or 4 values repeatedly (each one of these
> values is a different dithering phase applied to the source output). Of
> course, this is very likely to break tests using CRC readback since we
> don't expect the CRC to change if the source content hasn't changed.
> 
> So, hook up support for configuring the dithering property and reset it
> to off from igt_display_reset() when applicable.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---

I'm not in a position to speak to the correctness of the change, but
from a pure code point of view it looks good to me, so for whatever it's
worth:

Reviewed-by: Jeremy Cline <jcline@redhat.com>

>  lib/igt_kms.c | 6 ++++++
>  lib/igt_kms.h | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e9621e7e..d45adfaf 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -421,6 +421,7 @@ const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
>  	[IGT_CONNECTOR_LINK_STATUS] = "link-status",
>  	[IGT_CONNECTOR_MAX_BPC] = "max bpc",
>  	[IGT_CONNECTOR_HDR_OUTPUT_METADATA] = "HDR_OUTPUT_METADATA",
> +	[IGT_CONNECTOR_DITHERING_MODE] = "dithering mode",
>  };
>  
>  /*
> @@ -1802,6 +1803,10 @@ static void igt_output_reset(igt_output_t *output)
>  	if (igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA))
>  		igt_output_set_prop_value(output,
>  					  IGT_CONNECTOR_HDR_OUTPUT_METADATA, 0);
> +
> +	if (igt_output_has_prop(output, IGT_CONNECTOR_DITHERING_MODE))
> +		igt_output_set_prop_enum(output, IGT_CONNECTOR_DITHERING_MODE,
> +					 "off");
>  }
>  
>  /**
> @@ -1816,6 +1821,7 @@ static void igt_output_reset(igt_output_t *output)
>   * - %IGT_CONNECTOR_BROADCAST_RGB (if applicable)
>   *   %IGT_CONNECTOR_CONTENT_PROTECTION (if applicable)
>   *   %IGT_CONNECTOR_HDR_OUTPUT_METADATA (if applicable)
> + * - %IGT_CONNECTOR_DITHERING_MODE (if applicable)
>   * - igt_output_override_mode() to default.
>   *
>   * For pipes:
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index adca59ac..4899e765 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -127,6 +127,7 @@ enum igt_atomic_connector_properties {
>         IGT_CONNECTOR_LINK_STATUS,
>         IGT_CONNECTOR_MAX_BPC,
>         IGT_CONNECTOR_HDR_OUTPUT_METADATA,
> +       IGT_CONNECTOR_DITHERING_MODE,
>         IGT_NUM_CONNECTOR_PROPS
>  };
>  

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
