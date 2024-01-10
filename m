Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 836A5829619
	for <lists+nouveau@lfdr.de>; Wed, 10 Jan 2024 10:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A0010E565;
	Wed, 10 Jan 2024 09:18:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEA010E565;
 Wed, 10 Jan 2024 09:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704878307; x=1736414307;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=qtuO5lm+xc5XhKS1PbceP6Sf8OnGR6J64lv2VwUoaBU=;
 b=Dr+ffrVUAV9gP/+PiGFRGrJBHxeyZTm7hI5lGezXPTo0LP+U5/yYILB/
 nm6WzbIRtpHuXd/Gtx72d4rBWUOrmjbINRWhG/1IoSP79ZxKqE23c8fKA
 MfeqKR3DqrTkb3EWZtM8jyEahv3SJvo2x0UtRGHPZURi26OGnd1sFqBWu
 FcMfP6smZazN7IxpVgWQgfReJz9OCLEFIJpBO+VovpdHVMv9r2JKKUbNV
 thC1wW2oFIOHS3wIj3VIwsofLyAvGR6F0mlra1ea0uwZthyFN7ksmEB9I
 iH4kee+FhPpTo0TsJ7zdvmTjCbXOwQjvzbj1j4wX24DeD2mwek2mZsQtL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5232102"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5232102"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 01:18:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="775165326"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="775165326"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.36.240])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 01:18:21 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH 1/3] drm/nouveau: include drm/drm_edid.h only where needed
In-Reply-To: <6f343c87-fbb4-4779-aced-2e0df7b18e63@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240104201632.1100753-1-jani.nikula@intel.com>
 <95f6815c-1ff5-4c89-b8c6-0445834a0083@redhat.com>
 <87ttnmx1wn.fsf@intel.com>
 <6f343c87-fbb4-4779-aced-2e0df7b18e63@redhat.com>
Date: Wed, 10 Jan 2024 11:18:19 +0200
Message-ID: <87frz5wnqc.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, 09 Jan 2024, Danilo Krummrich <dakr@redhat.com> wrote:
> On 1/9/24 10:59, Jani Nikula wrote:
>> On Mon, 08 Jan 2024, Danilo Krummrich <dakr@redhat.com> wrote:
>>> On 1/4/24 21:16, Jani Nikula wrote:
>>>> Including drm_edid.h from nouveau_connector.h causes the rebuild of 15
>>>> files when drm_edid.h is modified, while there are only a few files that
>>>> actually need to include drm_edid.h.
>>>>
>>>> Cc: Karol Herbst <kherbst@redhat.com>
>>>> Cc: Lyude Paul <lyude@redhat.com>
>>>> Cc: Danilo Krummrich <dakr@redhat.com>
>>>> Cc: nouveau@lists.freedesktop.org
>>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>>
>>> Reviewed-by: Danilo Krummrich <dakr@redhat.com>
>> 
>> Are you going to pick this up via the nouveau tree, or shall I apply it
>> to drm-misc-next?
>
> We don't maintain a separate tree, hence feel free to apply it to drm-misc-next.

Thanks for the review, pushed to drm-misc-next.

You do still have

T:	git https://gitlab.freedesktop.org/drm/nouveau.git

MAINTAINERS entry, so I thought that's where you apply patches.

BR,
Jani.


-- 
Jani Nikula, Intel
