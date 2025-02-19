Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B62EFA3C05F
	for <lists+nouveau@lfdr.de>; Wed, 19 Feb 2025 14:46:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3759310E7F8;
	Wed, 19 Feb 2025 13:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Pt4yAbM6";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2396010E7F8
 for <nouveau@lists.freedesktop.org>; Wed, 19 Feb 2025 13:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739972813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UcJkjuEi1yYJnAiutiiyWh7ZzRjqlpKOLFtDnGJIPCQ=;
 b=Pt4yAbM6b4xUSdsPlJTvfRkT5CvsSFgMU6SFoOGzAgPbJ67lnumbxdEjffgI/rkjA6CfoL
 Ddq9PWyuIBqQM4XbylNeMWToJsvDx4qTGpD10152n+mUVde02bI2F9mzscFf2aNlb+ad4o
 RhMpz3/0QfCu9EEWoHz8OFodHCmDjjw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173--ke8112PPkqHtxKPXwhoRQ-1; Wed, 19 Feb 2025 08:46:51 -0500
X-MC-Unique: -ke8112PPkqHtxKPXwhoRQ-1
X-Mimecast-MFC-AGG-ID: -ke8112PPkqHtxKPXwhoRQ_1739972811
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c0a8583e60so355201285a.2
 for <nouveau@lists.freedesktop.org>; Wed, 19 Feb 2025 05:46:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739972811; x=1740577611;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UcJkjuEi1yYJnAiutiiyWh7ZzRjqlpKOLFtDnGJIPCQ=;
 b=XGDUM65dUTjHd1ank3ztN5Pn7Tz+bSRq1ROCH4vMaxviwjUPY3Na05COKCF41yXyiu
 dTCL9KAIXAV5XLzhj1v+JbLRMI8jH5IpAxdctPsb5qMr5c2VUwnsBgfRed5DqDoS3v3T
 gVcMuh5pqkYH2MPHB2JwGdJUkxpgk6WKTL4s75qJBqjKG/u5ZyQp5oC565RUhHuUnrAh
 NYv0GNXV3LEZgX4yEwIPIuUbYuWG2I26y4kayKL0PLBobl9HaWzBGxZeaVNW+jJj+VRc
 cotbWYNwNup05I44A98bzrU/fFunGWybWpQFFP+JIWequcuDaqN1epbop+bHYSvZpwm5
 Ywhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpTOL0eAVs/jisGsyVVFU0VWn4/I2HnqY0p0Dn6bk2Pi7XSa5wbCbjatiFnGtsFefVFNVXmuT7@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHEqolhoOduwnIcgV1zizLFxeyFApmZxtXTgSHo86OXBg32Uej
 oeJN9lzmogqOGyd2NUDTfzBBpJRgZIRqsJV/LCbDn/V18bjbNoMmHNovTlXbFMqYO19vUBJM/PF
 ppeTDQO5CA9/uYdVRGwPsenprkTfIbu4MPQZ46Ttp1EDrEIIfw+hiLo7Wl1Fe8dI=
X-Gm-Gg: ASbGncssAWDiy2nZYjnfygm3GN/smFJyxborPe0X7P5Ac/6ZP7BVVuI8PlXDkPqepvj
 6+KljtenKUIBx2gU3osEDe5yDhlgXNcsjX+kl++y5ymeXt26xe7rbkb6gYTscsH1hvEN0jFLP9T
 y757q7+7KSKeQKMGq1xrMXfbAprjLxrXvjxsQFQX9MaOjCSUFgJPYZTBA6cul5v84DQ75cvZcFA
 sa6e5otjP3G0S3V/YJcncSG7+r0Lfr1JnTlOwHlKQXvuGJBveMkXXQfdrtHi063Z+rTcVeBl/pw
 c4UpaV0b/yLJOg==
X-Received: by 2002:a05:620a:4805:b0:7c0:7818:8554 with SMTP id
 af79cd13be357-7c0b534e809mr606130785a.36.1739972811026; 
 Wed, 19 Feb 2025 05:46:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvt4PQDCLcNiUnb5vuuQvPmYW2M9pE931fM7yXu2Gz/T9k/kTKHHri1sWt4hM/n19iDe3ROg==
X-Received: by 2002:a05:620a:4805:b0:7c0:7818:8554 with SMTP id
 af79cd13be357-7c0b534e809mr606126185a.36.1739972810650; 
 Wed, 19 Feb 2025 05:46:50 -0800 (PST)
Received: from polis (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c097e43fb4sm394598485a.107.2025.02.19.05.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 05:46:49 -0800 (PST)
Date: Wed, 19 Feb 2025 14:46:46 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Karol Herbst <kherbst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 1/1] MAINTAINERS: Remove myself
Message-ID: <Z7XgxkxGIJm0OAue@polis>
References: <20250215073753.1217002-1-kherbst@redhat.com>
 <20250215073753.1217002-2-kherbst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250215073753.1217002-2-kherbst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p0HzoBCURrvUqbp-1lzHCHRVIKfwvIAJUtHzJE_ilAY_1739972811
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi Karol,

On Sat, Feb 15, 2025 at 08:37:53AM +0100, Karol Herbst wrote:
> Please respect my wishes and put this statement as is into the tree.

I applied this patch, as is, to drm-misc-fixes.

I respect the reasons you have and that you do so out of firm belief, yet I'm
sad to see you leaving this community.

Thank you for all the work you put into the nouveau driver!

- Danilo

