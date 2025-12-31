Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1976ACEB565
	for <lists+nouveau@lfdr.de>; Wed, 31 Dec 2025 07:20:39 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 113A910E97C;
	Wed, 31 Dec 2025 06:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="LCRTwwVd";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CFCEA44C5F;
	Wed, 31 Dec 2025 06:12:37 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767161557;
 b=f0YE1QTzWxD1vn3j3ptmBnWqrlB5zssDp5vLUU1A12cwBJDsuLbViTfmR7scbJLc6r/+N
 T/UZXP5MLp1iB0A43m6yLr6GYCiwBPNAcU3KjSDTUgGdBkjSQVNp7pmMyKuE1mBZhLl1405
 4zuqqaKIpIlodj36ZvNYSdGNFsRZFyugvDUJKGHAHbAyzmSXtTadui6JzABB8peMfr4TeX0
 +WKnp/nncjPMzgzU1Drk8yucRaRN0HOioLnd2QuXeKs683H0mXdfrVuWJdEzpvYm1VqSV6i
 v1T/HLkjTpYeNIr+Q8IMWahX6OmdfPS93FaWSzga8z9ocYUlFAe0XspuRnNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767161557; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=z64DZs+w89x8AC/nna2gxUPH589poWq3I+QyEvTvhfM=;
 b=MPUNTYFN3MDs8tM0+/enqp5XrKJh6TMlF1ewOuWV05vKqNmbTtP7A+6QEBbQRVjndnuZi
 kac2rsASO9WcOq8lG9taVqK2dcf2rb+shziEce1fHWg+AtHMwqAhHuXhLtbZknDBVfWY1Dd
 ISd6exUCjcknZGo26RraRsi2c/24KvOEVVwoJ9SVT7fkLv1CJt20TAdgZm/hDH9nAIrJHtt
 QU9Xy8ZP0lRsUDv+Et2Dp8+QYyvYqvSYbr6cUfyLEjT4AOApy/k+nwqiXvaKZLZO64lHxrE
 bXRkPBqVtIYD/p4veQv5PXATbkugnD4+RM3ruOjUapjPyyd1Ofbwd2PlOzsg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=linux.dev;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=linux.dev;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=linux.dev policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1C83E41C6B
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 06:12:34 +0000 (UTC)
X-Greylist: delayed 528 seconds by postgrey-1.36 at gabe;
 Wed, 31 Dec 2025 06:20:31 UTC
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com
 [95.215.58.173])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E871A10E010;
	Wed, 31 Dec 2025 06:20:31 +0000 (UTC)
Message-ID: <59736756-d81b-41bb-84ba-a1b51057cdd4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767161500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=z64DZs+w89x8AC/nna2gxUPH589poWq3I+QyEvTvhfM=;
	b=LCRTwwVdR4yj1tB08o9pZeHt1Fum5bvDmLdKMuLInfbyBZNXGThoxR1ceSCzlbYvdsTVSM
	AUkZHGpqnqjIme8hdkCmBi/zBVt0jRKFv4L/EE8GbWHZe8IYeNYy6+UTMNt7nDfgUofDYZ
	IngeS+KaYn4GpogGxJ6y600nYBHU3uE=
Date: Tue, 30 Dec 2025 22:11:34 -0800
MIME-Version: 1.0
Content-Language: en-US
To: Lyude Paul <lyude@redhat.com>, dakr@kernel.org,
 Timur Tabi <ttabi@nvidia.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: [REGRESSION][BISECTED] Freeze when nouveau loads GSP firmware during
 boot on Blackwell
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: MHZHC2V5NTXH3UU4K6NQDNENBMIUWF4Z
X-Message-ID-Hash: MHZHC2V5NTXH3UU4K6NQDNENBMIUWF4Z
X-MailFrom: matthew.schwartz@linux.dev
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: regressions@lists.linux.dev, nouveau@lists.freedesktop.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MHZHC2V5NTXH3UU4K6NQDNENBMIUWF4Z/>
Archived-At: 
 <https://lore.freedesktop.org/59736756-d81b-41bb-84ba-a1b51057cdd4@linux.dev/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hello,

On the 6.19-rc kernel series with linux-firmware 20251125, I have been unable to boot into the kernel while using nouveau on my RTX 5090 rig. 

It appears to freeze right after "nouveau 0000:01:00.0: gsp: RM version: 570.144" appears in my dmesg, and it locks up at this point. It works fine if I blacklist nouveau or use nomodeset.

After bisecting, the first bad commit is da67179e5538 ("drm/nouveau/gsp: Allocate fwsec-sb at boot"). As it's a Blackwell card, I cannot test with GSP disabled.

Still trying to figure out the best way to provide complete logs of the freeze, as it's too early to go into my journal and sysrq keys don't work when it freezes... 

Thanks,
Matt
