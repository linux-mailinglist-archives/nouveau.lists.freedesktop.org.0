Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E58C69B339
	for <lists+nouveau@lfdr.de>; Fri, 17 Feb 2023 20:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89DB310E1EC;
	Fri, 17 Feb 2023 19:38:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F4610E15B;
 Fri, 17 Feb 2023 19:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=IVvNxzJ/MYYOfgoLuHJ17dzipL9pSi1JZZiiDTevKw0=; b=j6Mg8xarwRuLOAkt6xKfjfU+GK
 VuWVsDRwqRFW+Xenyylnnk6wTFhc1zFSnWzxWAoHU49KB4fRExFfdmsPS5RsBfviEcuPFC921uy9L
 9Hr5l4tCsdd9Mq+L8RZF7yj/X/ZUoguJMzXh4E+DW5BZfGyC9TiwaeCw3IYOezS5GnfcDGRR7PbnR
 w6QDZ0rv8txqYW+za0a08qmt10QZ9Bqd/tQnWEBxHjktV8S5RQJbzI15mCnADRRpLgymrltXhFjdu
 7F4orbZyHkHAaatKo/SxKXMbWgMIeW84rfHeKuXL/DWQ8GPnYaXuMHnsnvHDCYR6pU7RasGrsMjWz
 mNCsdhfg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pT6YZ-009Znz-3q; Fri, 17 Feb 2023 19:38:07 +0000
Date: Fri, 17 Feb 2023 19:38:07 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Danilo Krummrich <dakr@redhat.com>
Message-ID: <Y+/Xn11dfdn7SfBD@casper.infradead.org>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-5-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217134422.14116-5-dakr@redhat.com>
Subject: Re: [Nouveau] [PATCH drm-next v2 04/16] maple_tree: add flag
 MT_FLAGS_LOCK_NONE
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
Cc: matthew.brost@intel.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 corbet@lwn.net, nouveau@lists.freedesktop.org, ogabbay@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, mripard@kernel.org,
 linux-mm@kvack.org, alexdeucher@gmail.com, boris.brezillon@collabora.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, bagasdotme@gmail.com,
 christian.koenig@amd.com, jason@jlekstrand.net
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Feb 17, 2023 at 02:44:10PM +0100, Danilo Krummrich wrote:
> Generic components making use of the maple tree (such as the
> DRM GPUVA Manager) delegate the responsibility of ensuring mutual
> exclusion to their users.
> 
> While such components could inherit the concept of an external lock,
> some users might just serialize the access to the component and hence to
> the internal maple tree.
> 
> In order to allow such use cases, add a new flag MT_FLAGS_LOCK_NONE to
> indicate not to do any internal lockdep checks.

I'm really against this change.

First, we really should check that users have their locking right.
It's bitten us so many times when they get it wrong.

Second, having a lock allows us to defragment the slab cache.  The
patches to do that haven't gone anywhere recently, but if we drop the
requirement now, we'll never be able to compact ranges of memory that
have slabs allocated to them.

