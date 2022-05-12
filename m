Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4EE524161
	for <lists+nouveau@lfdr.de>; Thu, 12 May 2022 02:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DE410EB28;
	Thu, 12 May 2022 00:08:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 416 seconds by postgrey-1.36 at gabe;
 Thu, 12 May 2022 00:08:00 UTC
Received: from mailincloud.com (proxy.mailincloud.com [217.182.87.46])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0876710EB28
 for <nouveau@lists.freedesktop.org>; Thu, 12 May 2022 00:08:00 +0000 (UTC)
Received: from [10.0.0.11] (91-166-155-32.subs.proxad.net [91.166.155.32])
 by mailincloud.com (Postfix) with ESMTPSA id B3D6A20827
 for <nouveau@lists.freedesktop.org>; Thu, 12 May 2022 02:01:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailincloud.com B3D6A20827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailincloud.com;
 s=mail; t=1652313662;
 bh=JjGLPODosrXpv6lkMQ/44trPimhz9Wc3Sap6QdVhNDY=;
 h=Date:To:From:Subject:From;
 b=XIyJ0h4Uyz5fjSZ76HOALWF+lxyEfkibsTWFFXDWX5DiPW585n9TGuFsB6UU9etKx
 Jw3x+oUcbxsE1iw6Qc3D7PPdeBN+pXf1uOfFVC/g37Qi8ExQnGDFX6ntZ+xRXefRAf
 ROlTIpSCoYIJ4psYbKRl7e/abhx5WSFgWWJzMNBha3hjrdBZz5o+Sd1H9rKXjYkZds
 xfY1wNOowaHa696zDMCwt4xhV5MgbGwH0CIa1GEOw8ntP/YtqCuUrMAEVpbffl1lCx
 Yd/7ktrT5Fv9zIE3H1HUcr/tjoz3iCiDBsVgKlsr/ugiuRu6MPbAVsF3EIcR7q0Eh5
 WdqXw0URz92TA==
Message-ID: <bdc569d7-ea37-809c-74ab-b34158ca645c@le-bars.net>
Date: Thu, 12 May 2022 02:00:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: nouveau <nouveau@lists.freedesktop.org>
Content-Language: en-GB
From: Yoann LE BARS <yoann@le-bars.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [Nouveau] nVidia has freed some modules, what to expect for Nouveau
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


Hello, everybody out there!

	It turns out nVidia has recently released some source concerning GPU 
kernel module:

https://github.com/NVIDIA/open-gpu-kernel-modules

	At first sight, it seems to me some good news. I wonder: will it be 
useful for Nouveau? Will it lead to some change in Nouveau?

	Best regards.

-- 
Yoann LE BARS
https://le-bars.net/yoann/
