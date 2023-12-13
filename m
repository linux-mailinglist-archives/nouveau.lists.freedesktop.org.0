Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C271812332
	for <lists+nouveau@lfdr.de>; Thu, 14 Dec 2023 00:37:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB6710E89D;
	Wed, 13 Dec 2023 23:37:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B6210E876
 for <nouveau@lists.freedesktop.org>; Wed, 13 Dec 2023 23:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702510646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2bM5SMenaJ88uFf7XU2jdKzO8ftktLKCbuzz3KkFPnI=;
 b=Z379D3z3ZVFdfpMtzBNEqKDYh36ldqXHHjAlTd8BVg8PHs9j52XgoN+hu/BRCvwoTST+i3
 WXQZ6LRA8KI8qqZevc2P3pLb0SN182PBaUeYPuvG3BAWnhawS/vvy+vF9976ADYYT0asTo
 Z11z9HyeZgHR6w/z1hcpTehRKMEecrE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-6r-1y0mdOUGNM4xkijMvLg-1; Wed, 13 Dec 2023 18:37:24 -0500
X-MC-Unique: 6r-1y0mdOUGNM4xkijMvLg-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-77f96e14ee2so129259585a.1
 for <nouveau@lists.freedesktop.org>; Wed, 13 Dec 2023 15:37:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702510644; x=1703115444;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2bM5SMenaJ88uFf7XU2jdKzO8ftktLKCbuzz3KkFPnI=;
 b=rMA/A/HB5G828WwiTIlmtDVWBXdVw6dXsnh52k5u27BQnw0XYmnoRZSDHSETSnmhFX
 zewChcBMWSFbofyJw3pCYu9ImXA+7+jbOFPwNZTDSCJa6QMXtHA/dYmb+Bappisqqz0a
 W76x7I7eZNR+6wqscw6WF9JTOfZ7f6YRi/J9L5kbtS2K5EWLRoRcmS68lpYwoZcSSc93
 Ep7bDsmWunPh59O6Kau/EXCCq8cZpskFqVh19Hbgb0gyCWeCEHa8tlO42iXdWuiFlFyo
 MRHw6HzbNEcLdRjjsKy1Qjk31suXj2lrsLjbBUUeCxMGlUY3GN/SzmAZfPqwbmbCW8KS
 8RBw==
X-Gm-Message-State: AOJu0YzNx39Oht8n1UrjXrWMYGXEIzgJy1hzAWbILPBal0TO8oIIii9U
 EK6K9i4g3wmQdieybBtJaUcIb0pDKW5iT1wXTwdsdrNGYrxQHsdxAaP6k1p3opNXNXgroS7iacL
 Ocnh4KYQqjXHaA2olgj8Nx4jgoQ==
X-Received: by 2002:a05:620a:2603:b0:77b:e2ae:934c with SMTP id
 z3-20020a05620a260300b0077be2ae934cmr10952568qko.12.1702510644401; 
 Wed, 13 Dec 2023 15:37:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUVH/OQpyNoeiuSGiiYho89l/+ehiBCwR+TccPGs5nC6eWuLzhfay1fvd3HpT8GnD42ZeXXA==
X-Received: by 2002:a05:620a:2603:b0:77b:e2ae:934c with SMTP id
 z3-20020a05620a260300b0077be2ae934cmr10952558qko.12.1702510644183; 
 Wed, 13 Dec 2023 15:37:24 -0800 (PST)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a05620a270500b0076ce061f44dsm4878672qkp.25.2023.12.13.15.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 15:37:23 -0800 (PST)
Message-ID: <114bf9f5790f637a6cdec4957244192d3bd76a04.camel@redhat.com>
Subject: Re: nouveau 0000:01:00.0: drm_WARN_ON(!found_head)
From: Lyude Paul <lyude@redhat.com>
To: Borislav Petkov <bp@alien8.de>, Paul Dufresne <dufresnep@zoho.com>, 
 Danilo Krummrich <me@dakr.org>
Date: Wed, 13 Dec 2023 18:37:22 -0500
In-Reply-To: <20231213124936.GCZXmoYDq8nMRs75XM@fat_crate.local>
References: <20231111120323.GAZU9tiw8e0RSzCGB9@fat_crate.local>
 <20231212224037.GAZXjhZUDeoq50xKJ5@fat_crate.local>
 <18c613ec092.ae61cf7d6029.4389632938517239705@zoho.com>
 <20231213113936.GBZXmX+MKqX/qOnPn1@fat_crate.local>
 <20231213124936.GCZXmoYDq8nMRs75XM@fat_crate.local>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Daniel Vetter <daniel@ffwll.ch>, nouveau <nouveau@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

agh - thank you for repeatedly poking on this, I've been busy enough with G=
SP
work I totally missed this. Yes - I'm quite surprised that this is blowing =
up,
but considering that looks to be a GT218 I guess display state readback mus=
t
just work a bit differently there since that's really early on into the NV5=
0
days.

The reason that was a drm_WARN_ON() was because it indicates that we're not
reading back OR -> head assignments properly. But, I'm confused how we're e=
ven
getting that far on a non-GSP platform. I'm going to dig into this now, but=
 if
I don't figure out a good fix by the end of the day I'll just send a patch =
to
silent the warning.

Thanks again for bugging me about this!

On Wed, 2023-12-13 at 13:49 +0100, Borislav Petkov wrote:
> On Wed, Dec 13, 2023 at 12:39:36PM +0100, Borislav Petkov wrote:
> > We're getting close to releasing so I guess we either debug this or shu=
t
> > up the WARN.
>=20
> Not only that - panic_on_warn turns this into an explosion so you don't
> want that in a released kernel.
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

