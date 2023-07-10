Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8895374CEE7
	for <lists+nouveau@lfdr.de>; Mon, 10 Jul 2023 09:48:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A764210E20D;
	Mon, 10 Jul 2023 07:48:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1C710E20B
 for <nouveau@lists.freedesktop.org>; Mon, 10 Jul 2023 07:47:58 +0000 (UTC)
Date: Mon, 10 Jul 2023 07:47:32 +0000
Authentication-Results: mail-4321.protonmail.ch;
 dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr
 header.b="ha0128kS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1688975270; x=1689234470;
 bh=eDjdHBj8Yjcgz28RxHZDLZUExZn6AoqNYAz+mtk8NPw=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=ha0128kSnqN6wOND40b3wKWrtO0Y439igKl3kBxIu6FPeXA+u0kA5hYW//k7Cdvun
 irE+zf2nIQXr0ky5DR4zdqFNu8KNlIdgyqXIIttcHvfVcVsPx0KmvNjz/j4mjuCAbk
 lY9ceH85n1DJA8qmoqe1dK4lZEaO50w+mcqkW/CPz2ocgBPGn+skRfWSuCfBW8t9wf
 sq8to+Qxr2n5a7i9ZVjO3ylor3bd5IMF0Z1pjI/82z34FidvotI53deCQcuzL8FANu
 q+SRvxrZ+e5YqB+Wy81P2IuGcZMfQPkm5GXoKS+uD8WNV+JCN9svmPDMZKAsdd+x2W
 UY0NiQzXNQHrw==
To: Lyude Paul <lyude@redhat.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <Ph6fyZ55sIDOCjbqUfSs1wSEq60UpYlMZYb3bYQdITGV_JqeaJXEVHSudp-QqT1usBznNKFws8RnuCVK1NR1aX8C-Q6nxqHlzxVUEsN2sdg=@emersion.fr>
In-Reply-To: <c94c3351895f3c74615ebb5a8b5cab2b8e5cae9d.camel@redhat.com>
References: <20230620181547.272476-1-contact@emersion.fr>
 <f70b3789d961861cdefb0752979d4666cdd151ba.camel@redhat.com>
 <7VkEmw9tAQsZuvc6AX3CTPGZx102IVl7z2vd8jHfIFxXPduS5d79gS1HpD40ik0Gr26myfu9edHs-kRtc_HIaxjIHFynRkiGRvkkGn6sp9g=@emersion.fr>
 <c94c3351895f3c74615ebb5a8b5cab2b8e5cae9d.camel@redhat.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/disp: use
 drm_kms_helper_connector_hotplug_event()
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Thanks for the review, I've pushed the patch.
