Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC68049EB60
	for <lists+nouveau@lfdr.de>; Thu, 27 Jan 2022 20:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0AD10E199;
	Thu, 27 Jan 2022 19:53:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 2438 seconds by postgrey-1.36 at gabe;
 Thu, 27 Jan 2022 18:02:31 UTC
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4AA10E225
 for <nouveau@lists.freedesktop.org>; Thu, 27 Jan 2022 18:02:31 +0000 (UTC)
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20RFPKWo009268;
 Thu, 27 Jan 2022 17:20:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pps0720; bh=QpjO5xsD8YzBkAUFyLkFIF/TwoWy4yKVLopWUDETO1c=;
 b=TfSONXEW9t4QqV2yAGRvk+7WVtGHYpojRLOmC3zzrxVcl9eU6Jnj5ogsw8bPXyjDKx7G
 smfKrSw9yCUIxqAPr+ELIYEpSLwimVT92TEOHKuKpMTgTQLYlTE+nlMryxrBJuh3tNsr
 YW0wrKI1sJkYjcP1QqL057GxawcNCtgHD9ABhDPTROlycSKcMxoMmGqWB4xjXffnZWNG
 bWErM5S7RDeGTstpyl4znPKSSQbs8SQwXLQg9tglWFxSi5OC4hr83Aj6DDenBHhnizhs
 IjiAzmiR8BCBTPists1F1QNNCs26hqADLiKTER2GJMaJGDNoMRF/7Y+NHqvIx6xw79AZ XQ== 
Received: from g2t2354.austin.hpe.com (g2t2354.austin.hpe.com [15.233.44.27])
 by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3duprgw0fm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 17:20:43 +0000
Received: from g2t2360.austin.hpecorp.net (g2t2360.austin.hpecorp.net
 [16.196.225.135])
 by g2t2354.austin.hpe.com (Postfix) with ESMTP id 6D397C5;
 Thu, 27 Jan 2022 17:20:40 +0000 (UTC)
Received: from swahl-home.5wahls.com (unknown [16.99.224.14])
 by g2t2360.austin.hpecorp.net (Postfix) with ESMTP id 96FDF37;
 Thu, 27 Jan 2022 17:20:33 +0000 (UTC)
Date: Thu, 27 Jan 2022 11:20:33 -0600
From: Steve Wahl <steve.wahl@hpe.com>
To: Yury Norov <yury.norov@gmail.com>
Message-ID: <YfLUYSh8Qyv6wEHd@swahl-home.5wahls.com>
References: <20220123183925.1052919-1-yury.norov@gmail.com>
 <20220123183925.1052919-16-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220123183925.1052919-16-yury.norov@gmail.com>
X-Proofpoint-ORIG-GUID: d1Kt8X-N0PUO31rBEkE346Fy5PGO5vIJ
X-Proofpoint-GUID: d1Kt8X-N0PUO31rBEkE346Fy5PGO5vIJ
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_03,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1011 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=626 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201270102
X-Mailman-Approved-At: Thu, 27 Jan 2022 19:53:03 +0000
Subject: Re: [Nouveau] [PATCH 15/54] arch/x86: replace cpumask_weight with
 cpumask_empty where appropriate
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
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Russ Anderson <russ.anderson@hpe.com>, Steve Wahl <steve.wahl@hpe.com>,
 Peter Zijlstra <peterz@infradead.org>, nouveau@lists.freedesktop.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, x86@kernel.org,
 Mike Travis <mike.travis@hpe.com>, Ingo Molnar <mingo@redhat.com>,
 Dennis Zhou <dennis@kernel.org>, platform-driver-x86@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, Alexey Klimov <aklimov@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Pekka Paalanen <ppaalanen@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Dimitri Sivanich <dimitri.sivanich@hpe.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org, David Laight <David.Laight@aculab.com>,
 Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andy@infradead.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Steve Wahl <steve.wahl@hpe.com>

On Sun, Jan 23, 2022 at 10:38:46AM -0800, Yury Norov wrote:
> In some cases, arch/x86 code calls cpumask_weight() to check if any bit of
> a given cpumask is set. We can do it more efficiently with cpumask_empty()
> because cpumask_empty() stops traversing the cpumask as soon as it finds
> first set bit, while cpumask_weight() counts all bits unconditionally.
> 
> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> ---
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 14 +++++++-------
>  arch/x86/mm/mmio-mod.c                 |  2 +-
>  arch/x86/platform/uv/uv_nmi.c          |  2 +-
>  3 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index b57b3db9a6a7..e23ff03290b8 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -341,14 +341,14 @@ static int cpus_mon_write(struct rdtgroup *rdtgrp, cpumask_var_t newmask,
>  
>  	/* Check whether cpus belong to parent ctrl group */
>  	cpumask_andnot(tmpmask, newmask, &prgrp->cpu_mask);
> -	if (cpumask_weight(tmpmask)) {
> +	if (!cpumask_empty(tmpmask)) {
>  		rdt_last_cmd_puts("Can only add CPUs to mongroup that belong to parent\n");
>  		return -EINVAL;
>  	}
>  
>  	/* Check whether cpus are dropped from this group */
>  	cpumask_andnot(tmpmask, &rdtgrp->cpu_mask, newmask);
> -	if (cpumask_weight(tmpmask)) {
> +	if (!cpumask_empty(tmpmask)) {
>  		/* Give any dropped cpus to parent rdtgroup */
>  		cpumask_or(&prgrp->cpu_mask, &prgrp->cpu_mask, tmpmask);
>  		update_closid_rmid(tmpmask, prgrp);
> @@ -359,7 +359,7 @@ static int cpus_mon_write(struct rdtgroup *rdtgrp, cpumask_var_t newmask,
>  	 * and update per-cpu rmid
>  	 */
>  	cpumask_andnot(tmpmask, newmask, &rdtgrp->cpu_mask);
> -	if (cpumask_weight(tmpmask)) {
> +	if (!cpumask_empty(tmpmask)) {
>  		head = &prgrp->mon.crdtgrp_list;
>  		list_for_each_entry(crgrp, head, mon.crdtgrp_list) {
>  			if (crgrp == rdtgrp)
> @@ -394,7 +394,7 @@ static int cpus_ctrl_write(struct rdtgroup *rdtgrp, cpumask_var_t newmask,
>  
>  	/* Check whether cpus are dropped from this group */
>  	cpumask_andnot(tmpmask, &rdtgrp->cpu_mask, newmask);
> -	if (cpumask_weight(tmpmask)) {
> +	if (!cpumask_empty(tmpmask)) {
>  		/* Can't drop from default group */
>  		if (rdtgrp == &rdtgroup_default) {
>  			rdt_last_cmd_puts("Can't drop CPUs from default group\n");
> @@ -413,12 +413,12 @@ static int cpus_ctrl_write(struct rdtgroup *rdtgrp, cpumask_var_t newmask,
>  	 * and update per-cpu closid/rmid.
>  	 */
>  	cpumask_andnot(tmpmask, newmask, &rdtgrp->cpu_mask);
> -	if (cpumask_weight(tmpmask)) {
> +	if (!cpumask_empty(tmpmask)) {
>  		list_for_each_entry(r, &rdt_all_groups, rdtgroup_list) {
>  			if (r == rdtgrp)
>  				continue;
>  			cpumask_and(tmpmask1, &r->cpu_mask, tmpmask);
> -			if (cpumask_weight(tmpmask1))
> +			if (!cpumask_empty(tmpmask1))
>  				cpumask_rdtgrp_clear(r, tmpmask1);
>  		}
>  		update_closid_rmid(tmpmask, rdtgrp);
> @@ -488,7 +488,7 @@ static ssize_t rdtgroup_cpus_write(struct kernfs_open_file *of,
>  
>  	/* check that user didn't specify any offline cpus */
>  	cpumask_andnot(tmpmask, newmask, cpu_online_mask);
> -	if (cpumask_weight(tmpmask)) {
> +	if (!cpumask_empty(tmpmask)) {
>  		ret = -EINVAL;
>  		rdt_last_cmd_puts("Can only assign online CPUs\n");
>  		goto unlock;
> diff --git a/arch/x86/mm/mmio-mod.c b/arch/x86/mm/mmio-mod.c
> index 933a2ebad471..c3317f0650d8 100644
> --- a/arch/x86/mm/mmio-mod.c
> +++ b/arch/x86/mm/mmio-mod.c
> @@ -400,7 +400,7 @@ static void leave_uniprocessor(void)
>  	int cpu;
>  	int err;
>  
> -	if (!cpumask_available(downed_cpus) || cpumask_weight(downed_cpus) == 0)
> +	if (!cpumask_available(downed_cpus) || cpumask_empty(downed_cpus))
>  		return;
>  	pr_notice("Re-enabling CPUs...\n");
>  	for_each_cpu(cpu, downed_cpus) {
> diff --git a/arch/x86/platform/uv/uv_nmi.c b/arch/x86/platform/uv/uv_nmi.c
> index 1e9ff28bc2e0..ea277fc08357 100644
> --- a/arch/x86/platform/uv/uv_nmi.c
> +++ b/arch/x86/platform/uv/uv_nmi.c
> @@ -985,7 +985,7 @@ static int uv_handle_nmi(unsigned int reason, struct pt_regs *regs)
>  
>  	/* Clear global flags */
>  	if (master) {
> -		if (cpumask_weight(uv_nmi_cpu_mask))
> +		if (!cpumask_empty(uv_nmi_cpu_mask))
>  			uv_nmi_cleanup_mask();
>  		atomic_set(&uv_nmi_cpus_in_nmi, -1);
>  		atomic_set(&uv_nmi_cpu, -1);
> -- 
> 2.30.2
> 

-- 
Steve Wahl, Hewlett Packard Enterprise
